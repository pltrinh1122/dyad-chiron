#!/usr/bin/env bash
# Acceptance criteria for the minimal lifecycle (#16) — clarify → dispose → execute → blocked
# (+ done = closed). Statuses ARE the board lanes, 1:1; no other status vocabulary survives.
# bin/ws is the lifecycle single-home: these criteria pin its invariants offline (grep-level —
# the live flips are proven on the real repo, per the delivery evidence on #16):
#   1. clarify → dispose only via the lint-gated `ws converge` assertion
#   2. dispose → execute is the disposition; d-land directives recorded via `ws dland`
#   3. d-land off-dispose warns ("Sense not converged") and proceeds — never halts
#   4. claim gates on execute + lint + no lease; claim/release manage the lock:<branch> label
#   5. the old status vocabulary (proposed/ready/in-progress/elicit/operator/horizon) is gone
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"

# Invariant 1 — convergence assertion, lint-gated, the only clarify→dispose path.
assert "converge subcommand exists"            grep -q 'def converge' bin/ws
assert "converge flips clarify → dispose"      grep -qF '"status:dispose", "--remove-label", "status:clarify"' bin/ws
assert "converge is lint-gated"                grep -qF "ws converge: #{n} refused by readiness lint" bin/ws

# Invariant 2 — disposition recorded; metric derivable (timestamped events).
assert "dland records a DISPOSITION journal entry"  grep -qF 'DISPOSITION d-land ts=' bin/ws
assert "turns derives the disposition metric"       grep -qF 'disposition-turns' bin/ws

# Invariant 3 — d-land off-dispose: warn, not halt.
assert "dland warns 'Sense not converged' off-dispose"  grep -qF 'Sense not converged' bin/ws
assert "dland proceeds on the urgency override"         grep -qF 'urgency override' bin/ws

# Invariant 4 — claim gates on execute; lock:<branch> is the visible lease cache.
assert "claim gates on status execute"         grep -qF "not 'execute' — no disposition" bin/ws
assert "claim adds the lock label"             grep -qF '"--add-label", f"lock:{branch}"' bin/ws
assert "release removes the lock label"        grep -qF '"--remove-label", f"lock:{branch}"' bin/ws
assert "yield removes the lock label (race loser holds nothing)" \
  bash -c "[ \"\$(grep -cF '\"--remove-label\", f\"lock:{branch}\"' bin/ws)\" -ge 2 ]"

# Operator amendments (2026-07-07) — staleness gate + blocked-Sense semantics.
assert "convergence is timestamped in the journal"      grep -qF 'CONVERGE ts=' bin/ws
assert "staleness compares dep closedAt to CONVERGE ts" grep -qF 'closedAt' bin/ws
assert "stale convergence self-heals to clarify"        grep -qF 'staleness gate (#16)' bin/ws
assert "staleness enforced at lint, gate, and claim (3 call sites + def)" \
  bash -c "[ \"\$(grep -c 'stale_deps(' bin/ws)\" -ge 4 ]"
assert "blocked bars execution only — Sense permeable"  grep -qF 'Sense is permeable' bin/ws

# Invariant 5 — lanes are the only statuses; the flip-gate heals dispose → clarify.
assert "lanes declared 1:1 in the single home"  grep -qF '"clarify", "dispose", "execute", "blocked"' bin/ws
assert "gate reverts dispose → clarify"         grep -qF 'reverted dispose → clarify' bin/ws
assert "flip-gate workflow triggers on status:dispose"  grep -qF "status:dispose" .github/workflows/node-lint.yml
for stale in status:ready status:in-progress status:proposed status:elicit status:operator status:horizon; do
  absent "no stale vocabulary in bin/ws: $stale"                     bin/ws "$stale"
  absent "no stale vocabulary in node-lint.yml: $stale"              .github/workflows/node-lint.yml "$stale"
done

assert_done
