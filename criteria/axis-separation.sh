#!/usr/bin/env bash
# Acceptance criteria for the axis-separation design principle (DYAD.md > Design principles;
# node #21). The principle — separate orthogonal concerns into independent axes; never conflate
# them — grounded on the substrate we actually run: our label taxonomy. Three axes, three label
# families, no overlap:
#   status:*  = lifecycle STAGE  — exactly the four lanes (clarify · dispose · execute · blocked)
#   lock:*    = lease HOLDER      — a status: label may never name a holder
#   ws:*      = STREAM membership — nor a stream
# A status label that named an actor or a holder would be a conflation (the very defect #16
# repaired when it dissolved status:operator and split lock: out of status:). This check keeps
# that repair from silently regressing.
#
# Offline/deterministic floor (always runs): pins the axes in bin/ws, the taxonomy's single home.
# Live grounding (single `bin/gh label list` call, best-effort): asserts the real repo's labels
# still respect the axes; if gh is unreachable it is skipped, not failed — the offline floor is
# the earned contract, per ws-lint.sh's "live gate proven separately" pattern.
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"

# --- Offline floor: the axes are declared, distinct, and single-homed in bin/ws ------------------
LANES='"clarify", "dispose", "execute", "blocked"'
assert "stage axis: bin/ws declares exactly the four lanes (1:1, #16)"  grep -qF "$LANES" bin/ws
assert "stage axis reads only the status: prefix"      grep -qF 'l["name"].startswith("status:")' bin/ws
assert "holder axis is a separate family: lock:"       grep -qF 'l["name"].startswith("lock:")' bin/ws
assert "stream axis is a separate family: ws:"         grep -qF 'l["name"].startswith("ws:")' bin/ws

# No actor/holder vocabulary may leak back into the stage axis (the dissolved status:operator, and
# every other pre-#16 status that conflated a non-stage concern with the lane).
for leak in status:operator status:in-progress status:ready status:proposed status:elicit status:horizon; do
  absent "no conflating status vocabulary in bin/ws: $leak"          bin/ws "$leak"
done

# The principle is codified where it will be read every session, with its diagnostic half.
assert "DYAD.md carries the Design principles section"    grep -qF '## Design principles' DYAD.md
assert "DYAD.md states the axis-separation principle"     grep -qF 'independent axes; never conflate them' DYAD.md
assert "DYAD.md carries the diagnostic half"              grep -qF 'apparent tradeoff is often a conflation artifact' DYAD.md
assert "derivation note recorded"                         test -f reflect/axis-separation.md

# --- Live grounding: the real repo's labels respect the axes (single gh read, best-effort) -------
if labels="$(bin/gh label list --json name -q '.[].name' 2>/dev/null)" && [ -n "$labels" ]; then
  statuses="$(printf '%s\n' "$labels" | grep '^status:' || true)"
  # Every status:* label is one of the four lanes — no actor, no holder, no stream on the stage axis.
  stray="$(printf '%s\n' "$statuses" | grep -vE '^status:(clarify|dispose|execute|blocked)$' || true)"
  assert "live: every status:* label is one of the four lanes" test -z "$stray"
  [ -n "$stray" ] && echo "       stray status labels: $(echo $stray)"
  # Holders and streams are homed on their own axes (present, and never under status:).
  assert "live: holder concerns live only in lock:*" bash -c 'printf "%s\n" "'"$labels"'" | grep -q "^lock:"'
  assert "live: stream concerns live only in ws:*"   bash -c 'printf "%s\n" "'"$labels"'" | grep -q "^ws:"'
else
  echo "  ..   live label check SKIPPED (bin/gh unreachable) — offline floor stands"
fi

assert_done
