#!/usr/bin/env bash
# Acceptance criteria for README.md structure coverage — the provenance invariant (DYAD.md #5,
# Operator-elected 2026-07-07) applied to repo structure: README.md is the single home for
# "what is this artifact and where did it come from", so every TOP-LEVEL tracked artifact must
# be documented there. A structure doc that silently lags the tree is a conferred claim.
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"

assert "README.md exists at root" test -f README.md

# Every top-level tracked entry (file, dir, or submodule gitlink) appears by name in README.md.
for entry in $(git ls-files | sed 's|/.*||' | sort -u); do
  assert "README documents: $entry" grep -qF "$entry" README.md
done

# README names the provenance invariant's single home, and points back to it.
assert "README cites the invariant's home (DYAD.md #5)" grep -qF 'DYAD.md operating-policy #5' README.md
assert "DYAD.md #5 names this check as enforcement"     grep -qF 'criteria/readme-structure.sh' DYAD.md

assert_done
