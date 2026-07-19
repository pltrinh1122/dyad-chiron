#!/usr/bin/env bash
# Acceptance criteria for the completed directive vocabulary (node #31, 2026-07-09).
# Node #31 completes reflect/interaction-model.md §Directive vocabulary: it folds in
# d-start (the Start Session Discipline), a pointer entry for d-reflect + its settled
# scope, and the riff:/raff: mode-prefixes — all axis-separated within the section
# (lifecycle macros ⟂ session disciplines ⟂ mode-prefixes). Operator-directed #31;
# d-start mapped from dyad-bond; riff/raff + d-reflect-scope Operator-ratified 2026-07-09.
# These pin that the section DOCUMENTS the full vocabulary (grounded, not just claimed) —
# not its efficacy (that earns through wear-in, per #3's no-self-ratify invariant).
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"

model="reflect/interaction-model.md"

# --- the section header names the full vocabulary ---------------------------------------------
assert "section header names the full vocabulary (d-sense · d-land · d-start · d-reflect · riff/raff)" \
  grep -qE '^## Directive vocabulary:.*d-sense.*d-land.*d-start.*d-reflect.*riff/raff' "$model"

# --- A. lifecycle macros: d-start is homed here, beside d-sense/d-land -------------------------
assert "d-start entry present"                 grep -qF '**d-start**' "$model"
assert "d-start named the Start Session Discipline" grep -qF 'Start Session Discipline' "$model"
assert "d-start carries a How-to-resume runbook" grep -qF 'How to resume' "$model"
assert "runbook enumerates the mechanical probes (substrate · durability · anchor-currency · ./check)" \
  bash -c 'grep -qF "substrate" "'"$model"'" && grep -qF "durability" "'"$model"'" && grep -qF "anchor-currency" "'"$model"'" && grep -qF "./check" "'"$model"'"'
assert "runbook reads board + resume-pointer + banked STARTs" \
  bash -c 'grep -qF "resume-pointer" "'"$model"'" && grep -qF "banked" "'"$model"'"'
assert "load-bearing symmetry recorded (d-reflect writes STARTs ⟂ d-start reads them)" \
  grep -qF 'd-reflect writes STARTs' "$model"
assert "axis-separation divergence from bond recorded (no carry-forward.md)" \
  grep -qF 'no `carry-forward.md`' "$model"
assert "d-start mapped-not-ported from bond noted" grep -qF 'not ported' "$model"
assert "mechanical spine explicitly deferred" \
  bash -c 'grep -qF "Spine deferred" "'"$model"'" || grep -qF "spine" "'"$model"'"'

# --- B. session disciplines: d-reflect is a pointer + carries the settled scope ----------------
assert "d-reflect entry present"               grep -qF '**d-reflect**' "$model"
assert "d-reflect points to reflect/reflections.md (pointer, not copy)" \
  grep -qF 'reflections.md' "$model"
assert "d-reflect records the settled scope (session-wide default)" \
  grep -qF 'session-wide by default' "$model"
assert "d-reflect: #N scope (reflect on that node's arc)" \
  grep -qF 'd-reflect: #N' "$model"

# --- C. mode-prefixes: riff:/raff:, a distinct axis-separated category -------------------------
assert "riff: mode-prefix documented"          grep -qF '`riff:`' "$model"
assert "raff: mode-prefix documented"          grep -qF '`raff:`' "$model"
assert "mode-prefixes marked a distinct (non-macro) category" \
  bash -c 'grep -qF "distinct category" "'"$model"'" || grep -qF "Mode-prefixes" "'"$model"'"'

# --- axis-separation: three groups co-located but not conflated --------------------------------
assert "vocabulary axis-separated into the three groups" \
  bash -c 'grep -qF "Lifecycle macros" "'"$model"'" && grep -qF "Session disciplines" "'"$model"'" && grep -qF "Mode-prefixes" "'"$model"'"'

assert_done
