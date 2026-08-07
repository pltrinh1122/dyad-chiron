#!/usr/bin/env bash
# criteria/defer-resume.sh — paired verifier for the deferral-discipline invariant
# (reflect/interaction-model.md, Operator-ratified 2026-08-07): every blocked/waiting
# node states its resume condition EXPLICITLY — Blocked-by: #refs (node dep) or
# Resume-when: <world-condition>. This checks the invariant is DOCUMENTED; the live
# enforcement (that real deferred nodes carry it) rides the board's label layer, which
# offline checks can't see (honest limit) — d-rub is the catch.
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"
m="reflect/interaction-model.md"

assert "interaction-model exists"                    test -f "$m"
assert "deferral discipline documented"              grep -qiF 'Deferral discipline' "$m"
assert "named as a work-lifecycle principle"         grep -qiF 'work-lifecycle principle' "$m"
assert "resume form: Blocked-by (node dependency)"   grep -qF '`Blocked-by: #refs`' "$m"
assert "resume form: Resume-when (world-condition)"  grep -qF '`Resume-when: <world-condition>`' "$m"
assert "rationale: unstated resume = lost work"      grep -qiF 'not tracked work' "$m"

assert_done
