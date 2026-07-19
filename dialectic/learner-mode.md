# Learner-mode — the codified experience (SPEC)

> **WHY (provenance — DYAD.md #5).** Operator-directed 2026-07-16 (chat): the
> **v0→v1** step — codify the learner-mode experience so it stops being
> Agent-improvised (the state falsified this session: no runtime, one freeform-chat
> UI, hand-maintained K-record). Requirements elicited: substrate = **protocol-spec +
> thin bash shell**; K-record writes = **auto-write, Operator audits**; first scope =
> **assessment-UI first** (learning/delivery UI stays v0 Agent-improvised for now).
> Grounds `pedagogy-foundations.md` §8 into a runnable contract. Mechanical shell:
> `bin/learn`. Ledger it reads/writes: `dialectic/k-record.md`. Ledger
> well-formedness (so auto-write is safe): `criteria/k-record.sh`.

## The two modes (help ON ⟂ help OFF)

Learner-mode has two sub-modes with **opposite helpfulness** — the defining UI split:

- **learning-UI (`chiron.tutor`) — help ON.** Scaffolds, hints, worked examples,
  interactive delivery. *Not codified yet — stays **v0 Agent-improvised** (this scope
  is assessment-first).*
- **assessment-UI (`chiron.assessor` + `chiron.preceptor`) — help OFF.** No hints (a
  hint contaminates the gate), blind items, formal capture, gate + signal, recorded.
  **Codified below.**

## Role-purity (the clean-room discipline)

In learner-mode the Agent acts **only** as `chiron.tutor` / `chiron.assessor` /
`chiron.preceptor` — never as curriculum-designer or architect. This is what makes
the learner-experience a *faithful* evaluation instrument (judge ⟂ author).

- **Log, don't fix.** When the learner (or the Agent) notices a curriculum defect,
  **log it** — to the slice's `refresher-lever` / a defect note / the board — and
  **stay in learner-mode.** Fixing in-thread re-fuses author + learner and destroys
  the clean-room. The design-thread consumes the log (async coupling via the shared
  artifacts, not an in-line edit).

## Assessment-UI — the protocol

Mechanical steps are `bin/learn` + the auto-write; the **judgment** steps (generate,
grade, read fluency) are the Agent following this contract.

1. **Orient** *(mechanical — `bin/learn`)*. Read `k-record.md`; show the learner's
   standing — mastered slices, slices **due for a spaced re-test** (`durability:
   unverified` or aged), and next-available slices.
2. **Select + prereq-check.** Learner picks a slice. Confirm its prereqs are `PASS` in
   the K-record (a topic's assessment uses only ancestors' knowledge — §2a closure).
3. **Generate blind items** *(judgment — Agent)*. The learner has seen the bank, so
   draw **fresh** items to the topic's §2b invariants: single-construct · single-level
   · unambiguous · differential · objective-key, the *set* cue-decorrelated +
   mode-covered. *(Default: Agent-generates-fresh — the bank is a seen reference, not
   a blind pool; fresh generation is the blind path used for E-e/E-f/E-g.)*
4. **Administer** *(help OFF)*. Present the 3-item set; capture per item **call +
   reasoning + effort-tag** (`snap` / `deliberated`). **No hints, no feedback between
   items** (feedback contaminates later calls). *(Default: present the set, collect
   all answers, grade at end — cleanest for the gate.)*
5. **Grade the gate** *(judgment — `chiron.assessor`)*. An item is correct iff the
   **call matches the key AND the reasoning matches the operative reason** (the guard
   is the reasoning-requirement — §8.5). **Gate = all-correct → `PASS`, else
   `NOT-PASS`.**
6. **Read fluency** *(judgment — `chiron.preceptor`)*. Band from the **effort channel**
   (answer-form + self-reported tags; completion-time deferred), **conditional on
   correctness** (fluent only at what you got right). Point-in-time; set `durability:
   unverified` when earned immediately post-scaffold.
7. **Record** *(auto-write — Operator audits)*. Write/update the slice's row in
   `k-record.md`: `gate`, `fluency`, `earned` (today), `blind: yes`, `durability`,
   and any `refresher-lever`. The write lands immediately; the Operator audits the
   diff; `criteria/k-record.sh` guards well-formedness.
8. **Route** *(advisory — signal, not enforcement)*. Emit the `(PASS/NOT-PASS,
   fluency-band)` tuple + next-step options (`PASS·not-fluent` → *offer* a refresher;
   `PASS·fluent` → next slice; `NOT-PASS` → re-learn). **The learner disposes** —
   nothing here gates the climb except the `PASS/NOT-PASS` itself.

## Flagged defaults (Operator may override)

- **Item source:** Agent-generates-fresh (bank is seen). Alt: maintain an unseen blind
  pool per topic.
- **Granularity:** present-set-then-grade. Alt: strict one-at-a-time sequential (no
  feedback), same grade-at-end.
