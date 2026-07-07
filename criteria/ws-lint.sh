#!/usr/bin/env bash
# Acceptance criteria for WS-NL (#14; lanes per #16) — dispose means headless-dispatchable.
# The lint is itself
# held to earnedness: fed counterfeits (each field missing, an open elicit, an open dependency)
# it must FAIL naming the miss; fed a complete node it must PASS (a lint that fails everything
# proves nothing). Offline via --fixture; the live gate is proven on the real repo separately.
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT

# A contract-complete body.
cat > "$tmp/good.md" <<'EOF'
**Intent:** a complete, self-contained commission for a sub-agent.
**Acceptance criteria:**
- criterion one, self-judgeable
**Context:** bin/ws, criteria/_lib.sh, DYAD.md #5
**Delivery:** branch work/x; evidence ./check; release --done
**Depends-on:** —
**Elicit:** — (none)
EOF
assert "lint passes a complete node" bin/ws lint --fixture "$tmp/good.md"

# Each required field, removed in turn, must fail AND be named.
for f in Intent "Acceptance criteria" Context Delivery; do
  python3 - "$tmp/good.md" "$f" "$tmp/miss.md" <<'PY'
import re, sys
body = open(sys.argv[1]).read()
open(sys.argv[3], "w").write(re.sub(rf"\*\*{sys.argv[2]}:\*\*.*\n(- .*\n)*", "", body))
PY
  assert "lint fails when '$f' is missing" bash -c '! bin/ws lint --fixture "'"$tmp"'/miss.md"'
  assert "lint names the miss: $f" bash -c 'bin/ws lint --fixture "'"$tmp"'/miss.md" | grep -qF "missing field: '"$f"'"'
done

# Field markers tolerate qualifier text before the colon (#16 — defect found live: the
# flip-gate falsely reported "missing field: Intent" on a "**Intent (converged …):**" marker).
sed -e 's/^\*\*Intent:\*\*/**Intent (converged via 3-round elicitation, 2026-07-07):**/' \
    -e 's/^\*\*Acceptance criteria:\*\*/**Acceptance criteria (self-judgeable):**/' \
    "$tmp/good.md" > "$tmp/qualified.md"
assert "lint tolerates qualifier text before the colon" bin/ws lint --fixture "$tmp/qualified.md"

# An open elicit must fail; a resolved one (good.md) already passed above.
sed 's/^\*\*Elicit:\*\*.*/**Elicit:** which color should it be?/' "$tmp/good.md" > "$tmp/elicit.md"
assert "lint fails on an open elicit" bash -c '! bin/ws lint --fixture "'"$tmp"'/elicit.md"'

# Dependencies: open dep fails, closed dep passes (simulated state — offline).
sed 's/^\*\*Depends-on:\*\*.*/**Depends-on:** #3/' "$tmp/good.md" > "$tmp/deps.md"
assert "lint fails on an open dependency"  bash -c '! bin/ws lint --fixture "'"$tmp"'/deps.md" --deps open'
assert "lint passes when dependencies closed" bin/ws lint --fixture "$tmp/deps.md" --deps closed

# Wiring: claim is lint-gated; the flip-gate exists and delegates to the single home.
assert "claim delegates to readiness lint"      grep -q 'refused by readiness lint' bin/ws
assert "flip-gate workflow exists"              test -f .github/workflows/node-lint.yml
assert "flip-gate delegates to bin/ws gate"     grep -q 'bin/ws gate' .github/workflows/node-lint.yml
assert "committed executable (git 100755): bin/ws" \
  bash -c '[ "$(git ls-files -s bin/ws | cut -d" " -f1)" = "100755" ]'

assert_done
