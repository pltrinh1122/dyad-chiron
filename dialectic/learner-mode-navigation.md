# Learner-mode navigation gap — evaluation finding (DEFECT NOTE)

> **WHY (provenance — DYAD.md #5).** Operator-directed d-start 2026-07-19 (chat,
> alignment channel): *"session goal is to enter learner-mode to evaluate the full
> experience,"* against a stated **learner-mode-invariant** (below). The Agent
> entered learner-mode (`bin/learn` + traced the `dialectic/learner-mode.md`
> protocol forward as the learner would) and evaluated the navigation surface.
> Disposition on the finding: **evaluate only** (Operator, this session) — *log the
> gap, stay out of the harness*; the fix is a separate, later Operator disposition.
> This note is that log. Per `dialectic/learner-mode.md` (Role-purity — *"Log,
> don't fix … the design-thread consumes the log … via the shared artifacts, not
> an in-line edit"*), it is a **separate** artifact, not an edit to the spec, so
> author ⟂ learner/evaluator stays clean. Target of the finding is **`ws:harness`**
> (the learner-mode UI: `bin/learn` + `dialectic/learner-mode.md`), **not** a
> curriculum-content defect — so logging it does not breach the clean-room.

## The invariant under evaluation (Operator, verbatim)

> **learner-mode-invariant:** the learner should **always know where they are** and
> **what they can do next**, accompanied by guidance — on **two axes**:
> **curriculum-navigation** (where am I on the learning path) ⟂ **ui-navigation**
> (what actions are available to me now).

## Verdict: the invariant does not currently hold — it fails on both axes

Evaluated from the learner's seat: run `bin/learn`, then try to answer *"where am I
on the path?"* and *"what do I do next?"* from what the experience actually shows.

### Axis 1 — curriculum-navigation ("where am I?") — **broken**

- **The path ahead is invisible.** `bin/learn` renders only the slices already
  present in the K-record (`logic_101`, `falsifiability_101`, `evidence_101` — T0–T2).
  The real ladder is **T0–T8** (`falsification-curriculum.md` §4.0, the topic table).
  A learner sees where they have *been*, never the whole map or the road ahead —
  T3–T8 do not appear at all.
- **"Next-available" is promised but not delivered.** The spec's Orient step
  requires the shell to *"show … mastered slices, slices due for a spaced re-test,
  and **next-available slices**"* (`dialectic/learner-mode.md`, Assessment-UI step 1).
  `bin/learn` shows standing and re-test-due, but **silently drops next-available** —
  a spec↔shell gap. Prereqs (T3←T1 · T4←T2,T3 · T5←T3 · T6←T3,T5 · T7←T4,T6 · T8←T5,T6,T7)
  live only in the curriculum prose, uncomputed, so the learner cannot tell which
  slices are **unlocked** vs **locked-pending-prereq**.
- **No progress sense.** No signal of *3-of-9 topics touched*, all at the 101 floor,
  with the 201 in-action climb (`falsification-curriculum.md` §4.0) not represented.

### Axis 2 — ui-navigation ("what can I do next?") — **broken**

- **"Next" is a doc-pointer, not an action.** The `== next ==` block resolves to
  *"follow the assessment protocol in dialectic/learner-mode.md"* — i.e. *go read the
  manual*. The learner is handed no concrete next-move (no slice to pick, no command,
  no prompt to issue).
- **No mode signal.** Learner-mode has two **opposite-helpfulness** sub-modes —
  help-ON `chiron.tutor` ⟂ help-OFF `chiron.assessor`/`chiron.preceptor`
  (`dialectic/learner-mode.md`, "The two modes"). The learner is never told **which
  mode is in force**. This matters: help-OFF is a contract (*no hints — a hint
  contaminates the gate*) the learner cannot honor if unaware of it.
- **No entry affordance.** `bin/learn` orients but offers no *"how to begin a rep"* —
  the learner must already know to prompt the Agent, and how.

## Proposed acceptance criteria (for whenever the fix is dispositioned)

The invariant holds when, from the learner's seat:

1. `bin/learn` renders the **full T0–T8 ladder** with per-slice state:
   `mastered` · `re-test-due` · **`available-now`** (prereqs PASS) · **`locked`**
   (naming the unmet prereq).
2. The **"next" block lists concrete next-choices** (e.g. the specific available
   slices and how to start), not a pointer to the spec.
3. The **active sub-mode** (help-ON / help-OFF) is stated on entry.

## Recorded mechanism disposition (Operator, this session)

- **Map source — compute in `bin/learn`.** The ladder + prereq/available state is
  **derived in the shell** by reading the curriculum doc (`falsification-curriculum.md`
  §4.0 topic table) and joining against the K-record — **single source of truth**, no
  new manifest artifact. (Operator-selected over "small curriculum map file" and
  "Agent decides.") This fixes the *where the map lives* fork; remaining mechanism is
  the Agent's to dispose at build time (fifth invariant).

## Status

**Logged, not fixed.** Awaits an Operator `dispose → execute` disposition to build
the fix on the harness (`bin/learn` + a spec touch-up closing the
Orient-step next-available gap). No harness code changed by this note.

---

*Pre-existing environment note (not part of this finding): in a fresh clone `./check`
reports `dyad-rt` MISS `core.hooksPath = .githooks` — the git-hook floor is wired by the
`bin/claude` launcher, not by a checkout. Unrelated to learner-mode; flagged for honesty.*
