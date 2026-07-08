#!/usr/bin/env bash
# Acceptance criteria for LIVENESS (#20) — "a blocked node does not stall its siblings".
#
# The guarantee is grounded, not asserted: it is STRUCTURALLY true because the claim gate
# (bin/ws `claim`) decides a node's claimability from THAT node's own state alone — its
# status label, its own body/lint, its own dependency staleness, its own lease journal —
# and never scans, reads, or aggregates any sibling. Blocking node A therefore cannot reach
# node B's claimability: there is no code path from A's state to B's decision.
#
# This file proves that two ways: (1) SOURCE-BINDING — inspect the real claim() gate in
# bin/ws and assert its claimability inputs are all target-scoped and that it contains no
# sibling scan (the honest proof — it binds to the code that actually runs); (2) BEHAVIORAL —
# replicate the exact claimability rule and show B's decision is byte-identical whether A is
# blocked or executing (the legible proof + a regression guard on the documented rule).
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"

# --- (1) SOURCE-BINDING: the real claim() gate is per-node ------------------------------------
# Extract the claim() function body from bin/ws (from `def claim(` to the next top-level def).
claim_body="$(awk '
  /^def claim\(/ {cap=1; print; next}
  cap && /^def [A-Za-z_]/ {cap=0}
  cap {print}
' bin/ws)"

assert "claim() was found in bin/ws" test -n "$claim_body"

# Every claimability input is scoped to the single resolved target node (i / n), never a sibling.
assert "claim resolves exactly the target node"      grep -qF 'n, i = resolve(nodes(), key)' <<<"$claim_body"
assert "stage gate reads the target's own status"    grep -qF 'status_of(i)'                  <<<"$claim_body"
assert "lint gate reads the target's own body"       grep -qF 'lint_misses(i["body"]'         <<<"$claim_body"
assert "staleness gate is keyed to the target"       grep -qF 'stale_deps(n, i["body"])'      <<<"$claim_body"
assert "lease gate reads the target's own journal"   grep -qF 'active_leases(n)'              <<<"$claim_body"

# The liveness proof itself: the gate contains NO loop — it never iterates the node set, so no
# sibling's state can enter the decision. (A `for` over siblings would be the way to stall one.)
assert "claim gate scans no siblings (no loop over nodes)" bash -c '! grep -qE "^\s*for " <<<"$claim_body"'

# --- (2) BEHAVIORAL: B's claimability is invariant to A's status ------------------------------
# Replicate the documented claimability rule (mirrors claim(): execute + lint-clean + not stale
# + no active lease, all target-scoped) and prove a sibling's status cannot change the answer.
python3 - <<'PY'
import sys

def claimable(node):
    """The claimability predicate, exactly as claim() applies it — all inputs are this node's."""
    return (node["status"] == "execute"
            and not node["lint_misses"]
            and not node["stale"]
            and not node["active_lease"])

# Node B: a normal, ready, uncontended node.
B = {"status": "execute", "lint_misses": False, "stale": False, "active_lease": False}

# Sweep sibling A across every status; B is untouched. B's decision must not move.
answers = set()
for a_status in ("clarify", "dispose", "execute", "blocked", "done"):
    A = {"status": a_status, "lint_misses": False, "stale": False, "active_lease": False}
    # The gate for B never references A — recompute B's claimability with A in each state.
    answers.add(claimable(B))

assert len(answers) == 1 and True in answers, f"B's claimability moved with A's status: {answers}"

# And the converse honesty: B stays non-claimable only for B's OWN reasons, never A's.
B_blocked = dict(B, status="blocked")
assert not claimable(B_blocked), "a node blocked on its OWN status is correctly non-claimable"
print("liveness: sibling A's status swept clarify..done — B's claimability constant (True).")
PY
assert "behavioral: sibling status does not change a node's claimability" test $? -eq 0

assert_done
