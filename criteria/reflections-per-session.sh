#!/usr/bin/env bash
# Acceptance criteria for reflections → per-session files (node #67, 2026-07-16).
# Node #67 retires the shared-append monolith: new session-reflections become
# per-session dated files `reflect/reflections/<date>-<slug>.md`, the directory
# listing IS the index (no stored index artifact; a generated `bin/ws reflections`
# render is DEFERRED), and `reflect/reflections.md` stands FROZEN as the archive of
# sessions 2026-07-07 … 2026-07-16 (no further appends, no migration).
# Forks ruled in chat (Operator-directed 2026-07-16): freeze + new-files-only ·
# directory-is-index. These pin the STRUCTURE (the home + the freeze), not the
# efficacy of any individual reflection (that earns through wear-in, per #3).
here="$(cd "$(dirname "$0")" && pwd)"; repo="$(cd "$here/.." && pwd)"
source "$here/_lib.sh"
cd "$repo"

model="reflect/interaction-model.md"
readme="reflect/reflections/README.md"
monolith="reflect/reflections.md"

# --- the per-session home exists, with a README describing the structure -----------------------
assert "per-session home directory exists (reflect/reflections/)" test -d reflect/reflections
assert "home README exists"                                       test -f "$readme"
assert "README describes the dated-file pattern (<date>-<slug>.md)" \
  grep -qF '<date>-<slug>.md' "$readme"
assert "README names the frozen archive (reflections.md)" \
  grep -qF 'reflections.md' "$readme"
assert "README records the directory-is-index posture (no stored index artifact)" \
  bash -c 'grep -qiF "no stored index" "'"$readme"'" || grep -qiF "directory listing IS the index" "'"$readme"'"'
assert "README records the deferred generated render (don-t-over-build)" \
  bash -c 'grep -qF "bin/ws reflections" "'"$readme"'" && grep -qiF "deferred" "'"$readme"'"'

# --- §B (d-reflect entry) names the new home + records the freeze ------------------------------
assert "§B d-reflect entry present"                               grep -qF '**d-reflect**' "$model"
assert "§B names the new per-session home (reflect/reflections/)" \
  grep -qF 'reflect/reflections/' "$model"
assert "§B keeps the frozen-archive pointer to reflections.md (criteria-grepped string)" \
  grep -qF 'reflections.md' "$model"
assert "§B records the freeze (frozen archive of 2026-07-07 … 2026-07-16)" \
  bash -c 'grep -qiF "frozen" "'"$model"'" && grep -qF "no further appends" "'"$model"'"'
assert "§B drops tail-append-to-the-monolith as the discipline (new-files-only)" \
  grep -qF 'never tail-append a shared file' "$model"

# --- the monolith is FROZEN: byte-for-byte unmodified (pinned blob) ----------------------------
# Freeze = no appends, no migration, no edits. Pin the git blob so ANY change to the
# monolith fails this check (deliverable #2: leave it byte-for-byte unchanged).
assert "monolith reflect/reflections.md is byte-for-byte frozen (pinned blob)" \
  bash -c '[ "$(git hash-object "'"$monolith"'")" = "22ffd2553a3832e9e0b9b54715f9b656cec5cc06" ]'

assert_done
