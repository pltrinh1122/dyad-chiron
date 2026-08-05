#!/usr/bin/env bash
# criteria/paired-verifier.sh — enforces the paired-verifier design principle
# (DYAD.md > Design principles): every earnable artifact ships with its verifier.
# The register is criteria/pairs.md; this check makes it COMPLETE (every criteria
# check is registered) and HONEST (every registered home + verifier exists). Base
# case: verifiers bottom out in EXECUTION — this check self-grounds, not via a
# further pair. NOT mechanized (human audit): that every earnable artifact is listed.
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"
man="criteria/pairs.md"

assert "the paired-verifier principle is documented (DYAD.md > Design principles)" \
  grep -qF '### Paired-verifier' DYAD.md
assert "the pairs register exists"            test -f "$man"

# data rows = table rows whose verifier field ($4) is a real name (not header/separator)
rows() { awk -F'|' '/^\|/{v=$4; gsub(/^ +| +$/,"",v); gsub(/`/,"",v); if(v!="" && v!="verifier" && v !~ /^-+$/) print}' "$man"; }
col()  { rows | awk -F'|' -v c="$1" '{x=$c; gsub(/^ +| +$/,"",x); gsub(/`/,"",x); print x}'; }

n_rows=$(rows | wc -l)
assert "register has entries (found $n_rows)" test "$n_rows" -ge 1

# 1) every verifier named in the register exists as criteria/<name>.sh
miss_v=""
while IFS= read -r v; do [ -f "criteria/$v.sh" ] || miss_v="$miss_v $v"; done < <(col 4)
assert "every registered verifier exists as criteria/<name>.sh (missing:${miss_v:- none})" test -z "$miss_v"

# 2) completeness: every criteria/[!_]*.sh is registered (no orphan check)
orphan=""
listed="$(col 4)"
for f in criteria/[!_]*.sh; do
  n=$(basename "$f" .sh)
  printf '%s\n' "$listed" | grep -qx "$n" || orphan="$orphan $n"
done
assert "every criteria check is registered in the register (orphans:${orphan:- none})" test -z "$orphan"

# 3) honesty: every registered home artifact exists (first path token)
miss_h=""
while IFS= read -r h; do
  p="${h%% *}"
  [ -e "$p" ] || miss_h="$miss_h $p"
done < <(col 3)
assert "every registered home artifact exists (missing:${miss_h:- none})" test -z "$miss_h"

echo "  note NOT mechanized (human audit): that EVERY earnable artifact is listed — the register asserts it; this check enforces register⟷criteria/ completeness + existence."
assert_done
