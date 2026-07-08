#!/usr/bin/env bash
# Acceptance criteria for the earnedness close gate (#26).
# Closing a node is a claim — "its acceptance criteria were earned" — so `ws release --done`
# must refuse while any criterion is unmet (the #13 breach: closed done with Projects-v2
# criteria the shipped Markdown surface could not satisfy; the Operator had to ask, not see).
# bin/ws is the single home; these pin the gate offline. Behavior is proven against the real
# `ws earned` path (which shares unmet_acceptance() with release()), not just greps.
#   1. the gate exists and is checked BEFORE any mutation (a refusal leaves the lease intact)
#   2. an unchecked `- [ ]` box refuses; a fully-checked list passes; no boxes refuses
#   3. the refusal names the carve-out path (decompose → successor node)
#   4. the honest limit (disposition, not truth) is recorded in-code
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"

# --- structural: the gate is single-homed in bin/ws and ordered before mutation ---------------
assert "gate helper exists (unmet_acceptance)"        grep -q 'def unmet_acceptance' bin/ws
assert "release --done consults the gate"             grep -qF 'refusal = unmet_acceptance(i["body"])' bin/ws
assert "gate parses the Acceptance criteria section"  grep -qF 'section_text(body, "Acceptance criteria")' bin/ws
assert "refusal names the carve-out path"             grep -qiF 'Carve-out: move the unmet criteria to a successor' bin/ws
assert "honest limit recorded (disposition not truth)" grep -qF 'NOT_YET_WIRED' bin/ws
assert "earned subcommand is dispatched"              grep -qF 'elif argv[0] == "earned"' bin/ws
assert "committed executable (git 100755): bin/ws"    bash -c '[ "$(git ls-files -s bin/ws | cut -d" " -f1)" = 100755 ]'

# The gate must precede the RELEASE journal + label mutation, so a refusal changes nothing.
# Assert the `unmet_acceptance` guard appears before the RELEASE comment line within release().
assert "gate is ordered before the RELEASE mutation (lease-safe refusal)" bash -c '
  awk "/^def release\(/{r=1; next} /^def /{r=0}
       r&&/refusal = unmet_acceptance/&&!g{g=NR} r&&/RELEASE branch=/&&!m{m=NR}
       END{exit !(g>0 && m>0 && g<m)}" bin/ws'

# --- behavioral: drive the real gate via `bin/ws earned --fixture` -----------------------------
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT

cat > "$tmp/unmet.md" <<'EOF'
**Intent:** demo node with one unmet criterion.
**Acceptance criteria:**
- [x] the earned one
- [ ] the unearned one
**Context:** —
**Delivery:** —
EOF

cat > "$tmp/met.md" <<'EOF'
**Intent:** demo node fully earned.
**Acceptance criteria:**
- [x] the earned one
- [x] the other earned one
**Context:** —
**Delivery:** —
EOF

cat > "$tmp/noboxes.md" <<'EOF'
**Intent:** demo node with prose criteria (no task list).
**Acceptance criteria:**
- the render works
- the sync heals
**Context:** —
**Delivery:** —
EOF

assert "behavioral: an unchecked box is refused (exit != 0)" \
  bash -c '! bin/ws earned --fixture "$0/unmet.md"' "$tmp"
assert "behavioral: the refusal lists the unmet criterion" \
  bash -c 'bin/ws earned --fixture "$0/unmet.md" 2>&1 | grep -qF "the unearned one"' "$tmp"
assert "behavioral: a fully-checked list is clear to close (exit 0)" \
  bin/ws earned --fixture "$tmp/met.md"
assert "behavioral: prose criteria with no boxes are refused" \
  bash -c '! bin/ws earned --fixture "$0/noboxes.md"' "$tmp"
assert "behavioral: no-box refusal asks for a checklist" \
  bash -c 'bin/ws earned --fixture "$0/noboxes.md" 2>&1 | grep -qiF "task-list checkboxes"' "$tmp"

assert_done
