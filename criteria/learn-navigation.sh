#!/usr/bin/env bash
# criteria/learn-navigation.sh — grounds the learner-mode-invariant (node #74):
# a learner reading `bin/learn` output ALONE can answer "where am I?" (the full T0–T8
# ladder with per-slice state) ⟂ "what can I do next?" (concrete next-choices + the
# active sub-mode). Also guards spec↔shell consistency and the fail-loud parse-guard.
# Earnedness made computational: if the shell stops answering both axes, ./check fails.
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"
spec="dialectic/learner-mode.md"

out="$(bash bin/learn 2>&1)" || { echo "  MISS bin/learn exited nonzero"; exit 1; }

# ── curriculum-nav: the FULL T0–T8 ladder is rendered ────────────────────────────────────────
for t in T0 T1 T2 T3 T4 T5 T6 T7 T8; do
  assert "ladder renders $t" bash -c 'grep -qE "^  '"$t"' " <<< "$1"' _ "$out"
done

# ── the four per-slice states are the vocabulary the shell speaks ─────────────────────────────
assert "state 'available-now' appears" grep -qF 'available-now' <<< "$out"
assert "state 'locked' appears"        grep -qF 'locked'        <<< "$out"
assert "state 're-test-due' appears"   grep -qF 're-test-due'   <<< "$out"

# ── against the live K-record: T3 is available-now, T4+ locked NAMING the unmet prereq ────────
assert "T3 shown available-now (prereq T1 PASS)" \
  bash -c 'grep -qE "^  T3 +available-now" <<< "$1"' _ "$out"
assert "T4 shown locked, names unmet prereq T3" \
  bash -c 'grep -E "^  T4 +locked" <<< "$1" | grep -q "T3"' _ "$out"
assert "T8 shown locked, names unmet prereqs T5/T6/T7" \
  bash -c 'grep -E "^  T8 +locked" <<< "$1" | grep -q "T5"' _ "$out"

# ── ui-nav: concrete next-choices (not a spec-pointer) + a way to start a rep ─────────────────
assert "next block lists concrete next-choices"  grep -qF 'AVAILABLE NOW' <<< "$out"
assert "next block says how to start a rep"       grep -qF 'chiron, assess T3' <<< "$out"

# ── sub-mode contract stated on entry (static, help OFF) ──────────────────────────────────────
assert "entry states the help-OFF assessment sub-mode" grep -qiF 'help off' <<< "$out"
assert "entry carries the no-hint gate-contamination contract" \
  bash -c 'grep -qiF "contaminates the gate" <<< "$1"' _ "$out"

# ── fail-loud parse-guard exists (guards silent §4.0 table drift) ─────────────────────────────
assert "bin/learn carries a fail-loud parse-guard" grep -qF 'PARSE-GUARD' bin/learn

# ── spec↔shell consistency: the Orient step promises what the shell shows ─────────────────────
assert "spec Orient step promises the full T0–T8 ladder" grep -qF 'T0–T8 ladder' "$spec"
assert "spec Orient step names available-now"            grep -qF 'available-now' "$spec"
assert "spec Orient step names locked (unmet prereq)"    grep -qF 'locked'        "$spec"
assert "spec Orient step declares the static sub-mode contract" \
  bash -c 'grep -qF "static contract declaration" "$1"' _ "$spec"

assert_done
