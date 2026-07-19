#!/usr/bin/env bash
# criteria/curriculum-lint.sh — enforce the MECHANICALLY-CHECKABLE curriculum-generation
# invariants (curriculum-topic-classification.md §2b) on the assessment bank. This MATERIALIZES
# those invariants from prose (level 1) to an ENFORCED check (level 3): a bad bank now FAILS
# ./check, instead of waiting for a human audit.
#
# HONEST SCOPE — only the mechanizable invariants are checked here. The judgment-bound ones
# (single-construct #1 · single-level #2 · unambiguous #3 · differential #4) cannot be
# mechanized; they stay human-audit and are NAMED at the end, not silently dropped. A green
# lint is necessary, never sufficient — the human audit is still required (no-self-ratify).
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"
bank="dialectic/falsification-assessment-bank.md"

assert "assessment bank exists" test -f "$bank"

# section extractor: a "## T..." topic heading through the next "## " heading
section() { awk -v h="$1" 'index($0,h)==1{f=1;next} /^## /{f=0} f' "$bank"; }

# invariant 7 — pass-threshold + standard-key adjudication are DECLARED
assert "grading protocol declares pass = 3/3"     grep -qiF 'pass = 3/3' "$bank"
assert "grading is against a standard answer key" grep -qiF 'standard answer key' "$bank"

# invariant 5 (each item keyed) + drawability: every topic pool has >= 3 keyed items
while IFS= read -r tid; do
  keys=$(section "$tid" | grep -cF '**Key:**')
  assert "topic $tid pool has >= 3 keyed items (found $keys)" test "$keys" -ge 3
done < <(grep -oE '^## T[0-9]+' "$bank")

# invariant 6 (cue-decorrelation floor): binary-answer topics must NOT be answer-uniform
# (checked per known binary topic; a new binary topic extends this list — honest limitation)
t1="$(mktemp)"; section '## T1' > "$t1"
assert "T1 falsifiability has BOTH F and U keys (not gameable-uniform)" \
  bash -c 'grep -qF "**Key:** **F**" "$1" && grep -qF "**Key:** **U**" "$1"' _ "$t1"
t2="$(mktemp)"; section '## T2' > "$t2"
assert "T2 evidence has BOTH a Sound and a Not-sound key (not gameable-uniform)" \
  bash -c 'grep -qF "**Key:** **Sound" "$1" && grep -qF "**Key:** **Not sound" "$1"' _ "$t2"
rm -f "$t1" "$t2"

# retired defective items must not reappear in the active pool
absent "retired ambiguous item ('rise by 2100', 2e) absent"       "$bank" "rise by 2100"
absent "retired entangled crystal item ('truly believes') absent" "$bank" "only when the patient truly believes"

# HONESTY: the judgment-bound invariants are NOT mechanized here (human audit, §2b)
echo "  note NOT mechanized — human audit still required: single-construct · single-level · unambiguous · differential"

assert_done
