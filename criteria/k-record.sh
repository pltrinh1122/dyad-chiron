#!/usr/bin/env bash
# criteria/k-record.sh — rung-3 well-formedness check on the K-record ledger
# (dialectic/k-record.md). Makes "auto-write, Operator audits" safe: a malformed
# auto-write to the ledger now FAILS ./check instead of silently corrupting learner
# state. Enforces the invariants pedagogy-foundations.md §8.2 relies on — the gate is
# PASS/NOT-PASS, fluency is one of the three bands.
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"
kr="dialectic/k-record.md"

assert "K-record exists"                                  test -f "$kr"
assert "K-record declares provenance (WHY)"              grep -qiF 'provenance' "$kr"
assert "K-record carries the Ledger section"             grep -qF '## Ledger' "$kr"
assert "reading rules name the gate as the hard record"  grep -qiF 'only hard record' "$kr"

# data rows carry a backtick slug in column 1
assert "ledger has at least one slice row" \
  bash -c 'awk -F"|" "\$2 ~ /\`/{n++} END{exit !(n>0)}" "$1"' _ "$kr"

# every row's gate is PASS or NOT-PASS
bad_gate=$(awk -F'|' '$2 ~ /`/ {g=$3; gsub(/^ +| +$/,"",g); if (g!="PASS" && g!="NOT-PASS") print g}' "$kr")
assert "every row gate is PASS or NOT-PASS (offenders: ${bad_gate:-none})" test -z "$bad_gate"

# every row's fluency is a valid band
bad_flu=$(awk -F'|' '$2 ~ /`/ {f=$4; gsub(/^ +| +$/,"",f); if (f!="not-fluent" && f!="partially-fluent" && f!="fluent") print f}' "$kr")
assert "every row fluency is a valid band (offenders: ${bad_flu:-none})" test -z "$bad_flu"

assert_done
