#!/usr/bin/env bash
# Acceptance criteria for the ratified interaction model (audit node #3, 2026-07-07).
# The audit's own earnedness: a "built as intended" claim without a passing check is conferred,
# not earned. These pin the model's now-checkable claims — NOT its efficacy (that earns through
# wear-in, per #3's no-self-ratify invariant). The claims grounded here:
#   1. the ledger has no committed WORKSTREAMS.md — the single home is GitHub Issues + bin/ws view
#   2. the model is homed, ratified, and traced at reflect/interaction-model.md; dialectic/ holds
#      no stale interaction-model artifact and stays self-describing (every tracked contest
#      artifact named in its README); no stale cross-refs remain
#   3. the primitive/vocab/WIP claims are documented where the model states them
#   4. DYAD.md #4 (channel discipline) and #5 (WIP + autonomy boundary) carry the codified sections
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"

model="reflect/interaction-model.md"

# --- 1. ledger single-home: GitHub Issues, no committed WORKSTREAMS.md to drift ---------------
assert "no committed WORKSTREAMS.md ledger" bash -c '! git ls-files | grep -q "WORKSTREAMS\.md"'

# --- 2. the model migrated to reflect/, ratified, traced; dialectic/ empty-of-contests --------
assert "model homed at reflect/interaction-model.md"  test -f "$model"
assert "model status is RATIFIED"                     grep -qF 'Status: RATIFIED' "$model"
assert "model carries the design↔as-built trace"      grep -qF 'Design ↔ as-built trace' "$model"
assert "model no longer at dialectic/"                bash -c '[ ! -e dialectic/interaction-model.md ]'
assert "dialectic/README exists (dir self-describing)" test -f dialectic/README.md
# Evolved 2026-07-11 (first live contest since the #3 migration): the original assert pinned
# dialectic/'s point-in-time EMPTINESS — true at the #3 audit, but over-broad: ontology #7 makes
# dialectic/ THE home for live contests, so a new contest legitimately falsifies it. The claim
# worth keeping is that the dir stays self-describing: every tracked contest artifact is named
# in its README. (Agent-disposed mechanism narrowing, fifth invariant; surfaced on node #61.)
assert "every dialectic/ artifact is named in dialectic/README.md" bash -c \
  'for f in $(git ls-files dialectic/ | grep -v "^dialectic/README.md$"); do
     grep -qF "$(basename "$f")" dialectic/README.md || exit 1; done'
# No tracked file still points at the pre-move path (this criteria file excluded — it names it).
assert "no stale dialectic/interaction-model.md cross-references" bash -c \
  '! git grep -q "dialectic/interaction-model.md" -- . ":!criteria/interaction-model.sh"'

# --- 3. the fork resolutions are documented where the model states them -----------------------
assert "primitive set documented (fork 2)" \
  grep -qF 'direct/steer/ratify/falsify ∥ propose/report/elicit/deliver' "$model"
assert "d-* documented as macros, not new primitives" grep -qF 'not new primitives' "$model"
assert "WIP-N=3 marked 'elected, not yet earned' (fork 1)" grep -qF 'elected, not yet earned' "$model"
assert "all four open forks marked resolved" bash -c \
  '[ "$(grep -c "RESOLVED" "'"$model"'")" -ge 4 ]'
# AC2 contradiction fixed: the workstream single-home now reads GitHub Issues, not WORKSTREAMS.md.
assert "model's workstream single-home is GitHub Issues" \
  grep -qF 'Single home: one GitHub Issue per workstream' "$model"

# --- 4. DYAD.md carries the codified sections (#4 channel, #5 WIP + autonomy) ------------------
assert "DYAD.md #4 no longer marked deferred" bash -c '! grep -qF "Channel discipline (#4) — deferred" DYAD.md'
assert "DYAD.md #4 codifies chat = alignment channel"   grep -qF 'Chat = the alignment channel' DYAD.md
assert "DYAD.md #4 codifies the Observe kanban"         grep -qF 'Observe kanban' DYAD.md
assert "DYAD.md #4 codifies no-deferrals governance"    grep -qF 'no deferrals / soon-later' DYAD.md
assert "DYAD.md #5 codifies WIP-N = 3"                  grep -qF 'WIP-N = 3' DYAD.md
assert "DYAD.md #5 codifies the autonomy boundary"      grep -qF 'Autonomy boundary (proactivity)' DYAD.md

assert_done
