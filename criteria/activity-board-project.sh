#!/usr/bin/env bash
# Acceptance criteria for the Projects v2 self-healing sync (#25) — the premium Observe surface.
#
# Grounds the sync POLICY OFFLINE: `bin/ws sync-project --fixture <json>` maps a node-list JSON
# (the shape bin/ws reads from the gh-issue API) to board lanes with NO network, token, or
# ProjectsV2 scope — the "provable by local-run diff" acceptance criterion, made a check. Proves
# the lane mapping (each status:* → its lane; CLOSED → done), the ws-only scope (a bare issue is
# not mapped), and the breach surfacing (zero/multi status:* → no clean lane, never guessed). The
# live add/set/remove/archive reconcile is inherently networked; its correctness is proven by the
# session's live drag-revert demo and the --plan diff, and its transport is asserted below.
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT

# One node per lane, a CLOSED (done) node, a zero-status breach node, and a bare non-ws issue.
cat > "$tmp/nodes.json" <<'EOF'
[
  {"number":201,"title":"clarify demo","state":"OPEN","url":"https://x/201","body":"i","labels":[{"name":"ws:demo"},{"name":"status:clarify"}],"closedAt":null},
  {"number":202,"title":"dispose demo","state":"OPEN","url":"https://x/202","body":"i","labels":[{"name":"ws:demo"},{"name":"status:dispose"}],"closedAt":null},
  {"number":203,"title":"execute demo","state":"OPEN","url":"https://x/203","body":"i","labels":[{"name":"ws:demo"},{"name":"status:execute"}],"closedAt":null},
  {"number":204,"title":"blocked demo","state":"OPEN","url":"https://x/204","body":"i","labels":[{"name":"ws:demo"},{"name":"status:blocked"}],"closedAt":null},
  {"number":205,"title":"done demo","state":"CLOSED","url":"https://x/205","body":"i","labels":[{"name":"ws:demo"}],"closedAt":"2026-07-06T00:00:00Z"},
  {"number":206,"title":"breach demo","state":"OPEN","url":"https://x/206","body":"i","labels":[{"name":"ws:demo"}],"closedAt":null},
  {"number":207,"title":"not a node","state":"OPEN","url":"https://x/207","body":"i","labels":[],"closedAt":null}
]
EOF
map="$tmp/map.txt"
bin/ws sync-project --fixture "$tmp/nodes.json" > "$map"

# Each status:* maps to its lane 1:1 (the minimal lifecycle, #16); CLOSED → done.
assert "clarify maps to its lane"          grep -qF '#201 → clarify' "$map"
assert "dispose maps to its lane"          grep -qF '#202 → dispose' "$map"
assert "execute maps to its lane"          grep -qF '#203 → execute' "$map"
assert "blocked maps to its lane"          grep -qF '#204 → blocked' "$map"
assert "CLOSED maps to done (derived)"     grep -qF '#205 → done' "$map"

# A zero/multi status:* node has no clean lane — surfaced as a breach, never guessed (#30's axis).
assert "breach node surfaced, not guessed" grep -qF '#206 → ⚠ breach' "$map"

# ws-only scope (#13 Q4): a bare (non-ws) issue is not a node and is not mapped onto the board.
assert "non-ws issue excluded from mapping" bash -c '! grep -qF "#207" "'"$map"'"'
assert "only the 6 ws nodes are mapped"     grep -qF '6 ws-node(s) mapped' "$map"

# Wiring: the sync policy single-homes in bin/ws; the workflow is trigger + transport only.
assert "sync-project command lives in bin/ws" \
  grep -q 'argv\[0\] == "sync-project"' bin/ws
assert "projects-v2 sync workflow exists"     test -f .github/workflows/activity-board-project.yml
assert "workflow calls bin/ws sync-project (policy single-homed)" \
  grep -q 'bin/ws sync-project' .github/workflows/activity-board-project.yml
assert "workflow consumes the #34 project-scoped secret" \
  grep -q 'DYAD_PROJECT_TOKEN' .github/workflows/activity-board-project.yml
assert "sync overwrites drift one-way (self-healing set-on-diff present)" \
  grep -q '_SET_Q' bin/ws
assert "committed executable (git 100755): bin/ws" \
  bash -c '[ "$(git ls-files -s bin/ws | cut -d" " -f1)" = "100755" ]'

assert_done
