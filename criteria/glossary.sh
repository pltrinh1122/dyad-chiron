#!/usr/bin/env bash
# criteria/glossary.sh — the paired verifier for the claim→constraint glossary
# (DYAD.md §8 Vocabulary), Operator-ratified 2026-07-19. This is the glossary
# *earning itself* (the paired-verifier discipline): the terms, the goal⟂constraint
# decomposition, the three constraint-scopes, the lifecycle, and the diagnostic tests
# must be DOCUMENTED (grounded, not just claimed). It does not check the glossary's
# efficacy — that earns through wear-in.
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"
d="DYAD.md"

assert "DYAD.md exists"                                   test -f "$d"
assert "§8 declares the claim→constraint vocabulary"      grep -qF 'The claim→constraint vocabulary' "$d"

# --- the descriptive line ----------------------------------------------------------------------
assert "term: falsifiable statement"                      grep -qF '**falsifiable statement**' "$d"
assert "term: falsifiable default"                        grep -qF '**falsifiable default**' "$d"

# --- the requirement = goal + constraint decomposition (the node model) ------------------------
assert "requirement decomposes into goal + constraint(s)" \
  grep -qF 'a **goal** + its **constraint(s)**' "$d"
assert "term: goal (aim to achieve)"                      grep -qF '**goal**' "$d"
assert "term: constraint (must hold)"                     grep -qF '**constraint**' "$d"
assert "invariant kept as the formal synonym of constraint" \
  grep -qF 'Formal synonym: **invariant**' "$d"
assert "the miss ⟂ breach distinction is drawn"           grep -qF 'Miss ⟂ breach' "$d"

# --- the three constraint scopes ---------------------------------------------------------------
assert "scope: principle (operating)"                     grep -qF '**principle** — a constraint on **how we operate**' "$d"
assert "scope: given (subject truth, Popper-safe)"        grep -qF '**given** — a constraint that is a **truth of the subject**' "$d"
assert "scope: form (artifact structure)"                 grep -qF "**form** — a constraint on an **artifact's structure**" "$d"

# --- below the line + the lifecycle + the tests ------------------------------------------------
assert "heuristic sits below the must-hold line"          grep -qF '**heuristic** — a *preferred* operating guide' "$d"
assert "the lifecycle arrow is documented"                grep -qF 'earned** when it ships its paired verifier' "$d"
assert "the three diagnostic tests are documented"        grep -qF 'Diagnostic tests:' "$d"

assert_done
