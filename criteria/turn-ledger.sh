#!/usr/bin/env bash
# criteria/turn-ledger.sh — rung-3 well-formedness check on the turn-ledger
# (dialectic/turn-ledger.md) and its governing counting rule (dialectic/turn-counting-rule.md).
# Makes the per-rep economy record safe to trust: a malformed ledger — or a turns count that
# was NOT earned by two-counter agreement — now FAILS ./check instead of being read as a trend
# point. Enforces the earnedness bar (node #7 invariant 2 / DYAD.md no-self-ratify): a recorded
# `turns` value must carry `agree = yes` AND machine == audit, and must be floored above 0.
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"
led="dialectic/turn-ledger.md"
rule="dialectic/turn-counting-rule.md"

# ── the counting rule (the durable spec) ─────────────────────────────────────────────────────
assert "counting rule exists"                            test -f "$rule"
assert "rule declares provenance (WHY)"                  grep -qiF 'provenance' "$rule"
assert "rule states the round-trip boundary"             grep -qiF 'round-trip' "$rule"
assert "rule states floored above 0"                     grep -qiF 'Floored above 0' "$rule"
assert "rule names the two independent counters"         grep -qiF 'two independent counters' "$rule"
assert "rule keeps cardinal-within ⟂ ordinal-across (#47)" grep -qF '#47' "$rule"

# ── the ledger (the per-rep record) ──────────────────────────────────────────────────────────
assert "turn-ledger exists"                              test -f "$led"
assert "ledger declares provenance (WHY)"                grep -qiF 'provenance' "$led"
assert "ledger points to the counting rule"              grep -qF 'turn-counting-rule.md' "$led"
assert "ledger carries the Ledger section"               grep -qF '## Ledger' "$led"
assert "ledger reading rules name the two-counter bar"   grep -qiF 'agree = yes' "$led"

# ── earnedness gate on real data rows ────────────────────────────────────────────────────────
# A data row's `turns` column ($8) is a positive integer. Placeholder/header/separator rows
# (turns = "—", "turns", "---") are non-numeric and skipped. For every real row:
#   floor:      turns >= 1  (never 0)
#   earned:     agree == "yes"  AND  machine (A) == audit (B)
bad_floor=$(awk -F'|' '$8 ~ /^[[:space:]]*[0-9]+[[:space:]]*$/ {t=$8+0; if (t<1) print NR}' "$led")
assert "every recorded rep is floored above 0 (offending rows: ${bad_floor:-none})" \
  test -z "$bad_floor"

bad_earn=$(awk -F'|' '
  $8 ~ /^[[:space:]]*[0-9]+[[:space:]]*$/ {
    a=$7; m=$5; u=$6
    gsub(/^[ \t]+|[ \t]+$/,"",a); gsub(/^[ \t]+|[ \t]+$/,"",m); gsub(/^[ \t]+|[ \t]+$/,"",u)
    if (a != "yes" || m != u) print NR
  }' "$led")
assert "every recorded turns value is earned: agree=yes AND machine==audit (offending rows: ${bad_earn:-none})" \
  test -z "$bad_earn"

assert_done
