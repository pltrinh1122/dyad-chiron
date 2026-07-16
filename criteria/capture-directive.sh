#!/usr/bin/env bash
# Acceptance criteria for the capture directive (node #60, 2026-07-16).
# Node #60 adds group D "Capture directives" to reflect/interaction-model.md §Directive
# vocabulary — axis-separated from A (lifecycle macros) / B (session disciplines) / C
# (mode-prefixes). It documents `todo:`/`idea:` as ONE directive (idea: = alias; the
# idea<->todo split rides the guessed ws:<stream> label, settled later by d-sense), the
# non-interruption contract (pointing to #20's four guarantees, not copying them), the
# capture <-> falsify invariant (seed status:clarify and STOP — no d-sense, no converge,
# no self-ratify), and a single-homed sub-agent capture brief. Mechanism reuses `bin/gh
# issue create`; a `bin/ws capture` helper is deferred. Operator-directed 2026-07-10 (d-start);
# one-directive + new-4th-category forks ruled in #60's chat-based d-sense.
# These pin that the section DOCUMENTS the capture directive (grounded, not merely claimed) —
# not its efficacy (that earns through wear-in, per #3's no-self-ratify invariant).
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"

model="reflect/interaction-model.md"

# --- the section header names the capture directive -------------------------------------------
assert "section header names the capture directive (todo/idea)" \
  grep -qE '^## Directive vocabulary:.*riff/raff.*todo/idea' "$model"

# --- D. capture directives: axis-separated fourth group ---------------------------------------
assert "group D 'Capture directives' heading present" grep -qF '### D. Capture directives' "$model"
assert "group D marked a distinct (fast-intake) category" grep -qF 'fast intake' "$model"
assert "vocabulary intro names four groups (adds capture directives)" \
  bash -c 'grep -qF "four co-located" "'"$model"'" && grep -qF "capture directives" "'"$model"'"'

# --- todo:/idea: are ONE directive (idea: = alias) --------------------------------------------
assert "todo: directive documented"            grep -qF '`todo:` / `idea:`' "$model"
assert "idea: documented as an alias (one directive)" \
  bash -c 'grep -qF "one directive" "'"$model"'" && grep -qF "alias" "'"$model"'"'
assert "idea<->todo split rides the guessed ws:<stream> label (settled later by d-sense)" \
  bash -c 'grep -qF "rides the guessed" "'"$model"'" && grep -qF "ws:<stream>" "'"$model"'"'

# --- non-interruption contract: points to #20's four guarantees (does not copy) ---------------
assert "non-interruption contract stated"      grep -qF 'Non-interruption contract' "$model"
assert "Operator pays zero interrupting turns"  grep -qF 'zero interrupting turns' "$model"
assert "main agent dispatches and immediately continues" grep -qF 'immediately continues' "$model"
assert "points to #20's four guarantees (integrity/liveness/observability/non-interruption)" \
  grep -qF 'integrity · liveness · observability · non-interruption' "$model"

# --- capture <-> falsify invariant: seed clarify and STOP; no self-ratify ---------------------
assert "capture <-> falsify invariant stated"  grep -qF 'Capture ⟂ falsify invariant' "$model"
assert "capture stops at clarify (does not converge / self-ratify)" \
  bash -c 'grep -qF "STOPS at clarify" "'"$model"'" && grep -qF "no-self-ratify" "'"$model"'"'
assert "no-self-ratify grounded in DYAD.md #5 (new nodes enter clarify)" \
  bash -c 'grep -qF "DYAD.md #5" "'"$model"'" && grep -qF "new nodes enter clarify" "'"$model"'"'
assert "falsification deferred to a later d-sense (capture is NOT a d-sense)" \
  bash -c 'grep -qF "later" "'"$model"'" && grep -qF "NOT" "'"$model"'" && grep -qF "d-sense" "'"$model"'"'

# --- sub-agent capture brief single-homed (mirrors #20 dispatch-brief template) ---------------
assert "sub-agent capture brief single-homed"  grep -qF 'Sub-agent capture brief (single home)' "$model"
assert "brief: Intent stub from the payload"   grep -qF 'stub' "$model"
assert "brief: best-guess ws:<stream>"         grep -qF 'best guess' "$model"
assert "brief: Context = captured mid-workflow, {date}" grep -qF 'captured mid-workflow, {date}' "$model"
assert "brief: leave in status:clarify; do not converge" \
  grep -qF 'Leave the node in `status:clarify`; do not converge' "$model"

# --- mechanism: reuse bin/gh issue create; bin/ws capture deferred ----------------------------
assert "mechanism reuses bin/gh issue create (carve-out pattern)" \
  bash -c 'grep -qF "bin/gh issue" "'"$model"'" && grep -qF "carve-out pattern" "'"$model"'"'
assert "bin/ws capture helper explicitly deferred (don't-over-build)" \
  bash -c 'grep -qF "bin/ws capture" "'"$model"'" && grep -qF "deferred" "'"$model"'"'

assert_done
