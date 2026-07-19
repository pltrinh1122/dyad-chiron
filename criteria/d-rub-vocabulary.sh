#!/usr/bin/env bash
# Acceptance criteria for adopting d-rub — the Validate discipline (node #69, 2026-07-16).
# Node #69 documents d-rub in reflect/interaction-model.md §Directive vocabulary group B
# (session disciplines), beside d-reflect: the four rungs (Ground → Read → Triangulate → Rub),
# the Agent-determined-depth rule, the name-the-rung transparency invariant, the map onto
# chiron's existing mechanisms (Rub ≡ falsify · Ground ≡ earnedness/./check · Read ≡ generated
# -views · Triangulate ≡ new), touchstone's two boundaries, and the honest wear-in status.
# Design ruled by #69 (home = group B · fidelity = map-not-port); mapped from dyad-touchstone.
# These pin that §B DOCUMENTS the discipline (grounded, not just claimed) — not its efficacy
# (that earns through wear-in, un-refuted-not-verified, per the honest status recorded below).
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"

model="reflect/interaction-model.md"

# Slice out group B (session disciplines) — assert the d-rub documentation lives THERE,
# not merely somewhere in the file (single-home: d-rub beside d-reflect).
bslice="$(mktemp)"
trap 'rm -f "$bslice"' EXIT
sed -n '/^### B\. Session disciplines/,/^### C\. Mode-prefixes/p' "$model" > "$bslice"

# --- group B now holds two disciplines; d-rub homed beside d-reflect ----------------------------
assert "group B intro records it now holds two disciplines" \
  grep -qF 'two** disciplines' "$bslice"
assert "d-reflect still present in group B"    grep -qF '**d-reflect**' "$bslice"
assert "d-rub entry present in group B"         grep -qF '**d-rub**' "$bslice"
assert "d-rub named the Validate discipline"    grep -qF 'Validate discipline' "$bslice"

# --- the four rungs, in order -------------------------------------------------------------------
assert "four rungs named in order (Ground → Read → Triangulate → Rub)" \
  grep -qF 'Ground → Read → Triangulate → Rub' "$bslice"

# --- the Agent-determined-depth rule + name-the-rung transparency invariant ---------------------
assert "Agent-determined depth rule stated" \
  grep -qF 'Agent-determined depth' "$bslice"
assert "depth matched to the ask, not fixed by the word" \
  grep -qF 'not fixed by which word was typed' "$bslice"
assert "name-the-rung transparency invariant recorded" \
  grep -qF 'transparency invariant' "$bslice"
assert "post-rub claim cites a this-run streak, not a cached shine" \
  grep -qF 'this-run streak' "$bslice"

# --- map onto chiron's existing mechanisms (no parallel machinery) ------------------------------
assert "Rub ≡ falsify primitive"               grep -qF 'Rub ≡ the' "$bslice"
assert "falsify stays the underlying G0 primitive the Rub rung invokes" \
  grep -qF 'stays the underlying G0 primitive' "$bslice"
assert "Ground ≡ earnedness / ./check"          grep -qF 'Ground ≡ earnedness' "$bslice"
assert "Read ≡ the CQRS generated-views"        grep -qF 'Read ≡ the CQRS generated-views' "$bslice"
assert "Triangulate ≡ new (two independent substrates)" \
  grep -qF 'Triangulate ≡ new' "$bslice"
assert "Triangulate maps to two independent substrates" \
  grep -qF 'independent substrates' "$bslice"

# --- the two boundaries preserved from the source ----------------------------------------------
assert "fact-check-vs-attack boundary (verify-against-source = Ground+Read, not Rub)" \
  grep -qF 'Fact-check vs. attack' "$bslice"
assert "anxiety-grain over-guard boundary (full ladder stays scoped to the stated target)" \
  grep -qF 'anxiety-grain over-guard' "$bslice"
assert "introspect / self-cognition out of scope" \
  bash -c 'grep -qF "introspect:" "'"$bslice"'" && grep -qF "out of scope" "'"$bslice"'"'

# --- honest status: adopted, efficacy earns through wear-in (carried, not stamped) --------------
assert "honest status: efficacy earns through wear-in" \
  grep -qF 'efficacy earns through wear-in' "$bslice"
assert "touchstone's claim carried as un-refuted, not verified" \
  grep -qF 'un-refuted' "$bslice"
assert "carried, not stamped (earnedness / no-self-ratify)" \
  bash -c 'grep -qF "no-self-ratify" "'"$bslice"'" && grep -qF "not stamp it" "'"$bslice"'"'

# --- provenance cites the source + map-not-port lineage -----------------------------------------
assert "provenance cites dyad-touchstone PLAYBOOK.md source" \
  grep -qF 'library/d-rub/PLAYBOOK.md' "$bslice"
assert "provenance cites the rub-protocol.md source" \
  grep -qF 'rub-protocol.md' "$bslice"
assert "map-not-port lineage noted (like d-start ← dyad-bond)" \
  grep -qF 'd-start ← dyad-bond' "$bslice"

# --- section header + intro widened to name d-rub ----------------------------------------------
assert "section header names d-rub" \
  grep -qE '^## Directive vocabulary:.*d-reflect.*d-rub' "$model"
assert "intro widens session disciplines to name both (reflect / validate)" \
  grep -qF 'validate a claim/state = d-rub' "$model"

assert_done
