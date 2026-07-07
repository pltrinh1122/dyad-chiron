#!/usr/bin/env bash
# Acceptance criteria for the Activity Board render core (#13) — the Observe channel.
#
# Grounds the TOKEN-INDEPENDENT engine OFFLINE: `bin/ws board --fixture <json>` renders from a
# node-list JSON (the same shape bin/ws reads from the gh-issue API), so no network, no token,
# no Projects v2 scope is touched. Proves: every ratified lane header renders; a known node's
# card renders; the three-family legend renders; the "generated — source of truth is
# issues/labels" marker renders; and a fixture carrying a lock:<branch> label renders the holder.
# The live surfaces (pinned issue + workflow) are trigger + transport over this same engine.
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT

# A node-list fixture: one node per lane, an execute node holding a lock, a blocked node with a
# Depends-on ref + Blocked: reason, and a closed (done) node. url/labels/state as gh returns them.
cat > "$tmp/nodes.json" <<'EOF'
[
  {"number":101,"title":"clarify demo","state":"OPEN","url":"https://x/101","body":"**Intent:** c\n**Elicit:** which color?","labels":[{"name":"ws:demo"},{"name":"status:clarify"}],"closedAt":null},
  {"number":102,"title":"dispose demo","state":"OPEN","url":"https://x/102","body":"**Intent:** d","labels":[{"name":"ws:demo"},{"name":"status:dispose"}],"closedAt":null},
  {"number":103,"title":"execute demo","state":"OPEN","url":"https://x/103","body":"**Intent:** e","labels":[{"name":"ws:demo"},{"name":"status:execute"},{"name":"lock:work/fixture"}],"closedAt":null},
  {"number":104,"title":"blocked demo","state":"OPEN","url":"https://x/104","body":"**Intent:** b\n**Depends-on:** #101\n**Blocked:** unscheduled","labels":[{"name":"ws:demo"},{"name":"status:blocked"}],"closedAt":null},
  {"number":105,"title":"done demo","state":"CLOSED","url":"https://x/105","body":"**Intent:** done","labels":[{"name":"ws:demo"}],"closedAt":"2026-07-06T00:00:00Z"}
]
EOF
board="$tmp/board.md"
bin/ws board --fixture "$tmp/nodes.json" > "$board"

# Every ratified lane renders a header (columns = the minimal lifecycle 1:1, #16).
for lane in clarify dispose execute blocked done; do
  assert "lane header renders: $lane" grep -qF "## $lane" "$board"
done

# A known node's card renders (id + title link).
assert "known node card renders (#103 execute demo)" \
  bash -c 'grep -qF "[#103](https://x/103)" "'"$board"'" && grep -qF "execute demo" "'"$board"'"'

# The lock:<branch> holder renders from the fixture's lock label.
assert "lock holder renders from a lock: label" grep -qF 'lock:work/fixture' "$board"

# The blocked card carries blocked-by #refs + Blocked: reason.
assert "blocked card carries blocked-by #refs"   grep -qF 'blocked-by #101' "$board"
assert "blocked card carries Blocked: reason"    grep -qF 'Blocked: unscheduled' "$board"

# An elicit marker renders.
assert "elicit marker renders" grep -qF '⚑ elicit:' "$board"

# The three-family legend renders.
assert "legend renders (label families)"  grep -qF 'the three label families' "$board"
assert "legend: ws:<stream> family"       grep -qF '`ws:<stream>`' "$board"
assert "legend: status:<lane> family"     grep -qF '`status:<lane>`' "$board"
assert "legend: lock:<branch> family"     grep -qF '`lock:<branch>`' "$board"

# The generated marker renders (no second home for status).
assert "generated marker renders" \
  grep -qF 'generated — source of truth is issues/labels' "$board"

# Wiring: the render core single-homes in bin/ws; the interim surface + workflow consume it.
assert "board command lives in bin/ws"        grep -q "argv\[0\] == \"board\"" bin/ws
assert "activity-board workflow exists"       test -f .github/workflows/activity-board.yml
assert "workflow calls bin/ws board (policy single-homed)" \
  grep -q 'bin/ws board' .github/workflows/activity-board.yml
assert "committed executable (git 100755): bin/ws" \
  bash -c '[ "$(git ls-files -s bin/ws | cut -d" " -f1)" = "100755" ]'

assert_done
