#!/usr/bin/env bash
# criteria/ratify-pr.sh — paired verifier for the Ratify→PR process principle
# (reflect/interaction-model.md #3, Operator-ratified 2026-07-22): on ratify of
# branch-landed work, the Agent automatically opens the PR for the Operator's merge.
# Checks the principle is DOCUMENTED (grounded, not just claimed); its *efficacy*
# (that the Agent actually does it) earns through wear-in — d-rub is the catch.
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"
m="reflect/interaction-model.md"

assert "interaction-model exists"                         test -f "$m"
assert "Ratify→PR process principle documented"           grep -qF 'Ratify → PR (process principle' "$m"
assert "principle: PR opened automatically on ratify"     grep -qiF 'automatically on ratify' "$m"
assert "principle: names the ratify→durability gap"       grep -qF 'ratify→durability gap' "$m"
assert "principle: merge stays the Operator's act"        grep -qF "merge stays the Operator's" "$m"

assert_done
