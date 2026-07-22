# K-record — learner proficiency ledger

> **WHY (provenance — DYAD.md #5).** Operator-directed 2026-07-16 (chat: *"persist
> the K-record"* — option 1). The pedagogy engine's **durable memory of a learner's
> proficiency**, read by `chiron.assessor` / `chiron.preceptor` to avoid re-teaching
> a mastered slice, route refreshers, and (next rung) detect staleness. Materializes
> the K-record from **chat-only state** — the gap that bit when `evidence-101`'s pass
> and fluency band had nowhere durable to live — to a committed, diffable ledger.
> Slice IDs use the ratified `_` slug convention (`pedagogy-foundations.md` §8.6);
> existing curriculum docs still use the hyphen (`evidence-101`) pending the parked
> migration. Migrates to the `ws:harness` home when created.

## Reading rules (grounded in `pedagogy-foundations.md` §8)

- **`gate` is the only hard record** (`PASS`/`NOT-PASS`). **`fluency` is signal, not
  enforcement** (§8.2) — learner-disposition; it never blocks a pass or a climb.
- **Per-slice** (§8.3). `logic_101 = fluent` ≠ `logic mastered`; staleness is
  slice-specific.
- **`fluency` is a *point-in-time* read** on the effort channel (answer-form +
  self-report; completion-time deferred, §8.4). A band earned *immediately
  post-scaffold* is `durability: unverified` until a **spaced re-test** confirms
  durable automaticity over fresh recall.
- **Routing is advisory** (§8.4): `PASS · not-fluent` → a refresher is *offered*, not
  forced. The learner disposes.

## Ledger — learner: Operator (dyad-chiron, class-of-one)

| slice | gate | fluency | earned | blind | durability | refresher-lever |
|---|---|---|---|---|---|---|
| `logic_101` (T0) | PASS | fluent | 2026-07-11 | partial ¹ | unverified | — |
| `falsifiability_101` (T1) | PASS | partially-fluent | 2026-07-19 | yes ² | verified | T1⟂T2 axis-drift — falsifiability ≠ study-validity (a claim's falsifiability doesn't depend on the trial being randomized) |
| `evidence_101` (T2) | PASS | fluent | 2026-07-16 | **yes** | **unverified** ³ | bias/randomization subtype taxonomy (survivor ≠ selection ≠ assignment) |

¹ Graded before the blind-item discipline was explicit; snap on the basic logic forms.
² Re-verified 2026-07-19 by a **fully-blind spaced re-test** — 3 fresh items, help OFF, 8 days after the 2026-07-11 pass: **3/3 correct**, so durability is now **verified**. (Prior sittings were not fully blind — Round 1 was gameable [qualification→U cue], re-run in Round 2.) Fluency **partially-fluent**, confirmed on the **effort channel** (self-reported tags: item 2 `snap`, items 1 & 3 `deliberated` → 1/3 automatic). Tell: the *snap* (item 2) is where the reasoning drifted to a T2 evidence-quality caveat (randomization) instead of naming the refuter, while the deliberated U-items were clean — the automatic reflex reaches for study-validity, and the falsifiability concept surfaces only under deliberation. Refresher target: make "can any observation refute?" the automatic first reach, de-conflated from evidence-soundness.
³ Blind 3/3 on fresh unseen items — but earned *immediately* after the L2 skill was scaffolded in-thread, so a **spaced re-test** is required to confirm durable automaticity vs fresh recall.

## Next materialization rung (not built — wu-wei)

A `criteria/`-style **staleness check** that reads the `earned` dates against a decay
window and flags slices due for a spaced re-test — turning `durability: unverified`
and aging `fluent` bands into actionable refresher prompts. This ledger is **rung 1**
(the durable record); the staleness computation is **rung 2** (an instrument that
reads it); an enforced `./check` on ledger well-formedness would be **rung 3**.
