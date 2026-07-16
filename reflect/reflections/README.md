# reflections/ — chiron's per-session retros (the `d-reflect` home)

> **Provenance:** node #67, Operator-directed 2026-07-16 (`d-sense: A` →
> forks ruled: **freeze + new-files-only** · **directory-is-index**). This is the
> home the `d-reflect` **Session-Close Discipline** writes to. Vocabulary entry:
> `reflect/interaction-model.md` §Directive-vocabulary group B.

## Structure — one file per session-thread

Each session banks its reflection as its **own dated file**:

```
reflect/reflections/<date>-<slug>.md      e.g. 2026-07-16-reflections-per-session.md
```

- `<date>` = the session's date, ISO `YYYY-MM-DD`.
- `<slug>` = a short kebab-case handle for the session's arc.

New reflections **never** tail-append a shared file. New files never collide, so
parallel work-threads — however long-lived — never conflict on reflections. This
is the whole point of #67: the old shared tail-append region was the *only*
cross-thread conflict surface, and new-files-only dissolves it (no cutover window,
no sequencing with any long-lived thread).

## The directory listing IS the index

There is **no stored index artifact** — `ls reflect/reflections/` (this directory)
*is* the index. A generated render (e.g. `bin/ws reflections`) is **explicitly
deferred** until browsing friction actually appears (don't-over-build). Do **not**
build one preemptively.

## Content-spec (CSS + SH) — single-homed in the frozen archive

The reflection **format** — CSS (CONTINUE · START · STOP) + SH (Should-Hold /
Should-Have, with the 2026-07-09 evidence-bar + no-miss default) — is documented
once, in the header of the frozen archive: [`../reflections.md`](../reflections.md).
*Point, don't copy:* write each session file to that spec; do not restate it here.

## Frozen archive — `reflect/reflections.md`

The prior monolith [`../reflections.md`](../reflections.md) stands **frozen** as
the archive of sessions **2026-07-07 … 2026-07-16**. It receives **no further
appends** — its existing dated sections are **not** migrated here (freezing, not
migrating, is what dissolves the transition cost). Read it for those five sessions;
write new sessions here.
