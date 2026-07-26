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
| `evidence_101` (T2) | PASS | partially-fluent | 2026-07-19 | yes ³ | unverified | integrative PPV (base rate × false-positive rate) at moderate base rate = evidence-201, deferred (relates #82) |

¹ Graded before the blind-item discipline was explicit; snap on the basic logic forms.
² Re-verified 2026-07-19 by a **fully-blind spaced re-test** — 3 fresh items, help OFF, 8 days after the 2026-07-11 pass: **3/3 correct**, so durability is now **verified**. (Prior sittings were not fully blind — Round 1 was gameable [qualification→U cue], re-run in Round 2.) Fluency **partially-fluent**, confirmed on the **effort channel** (self-reported tags: item 2 `snap`, items 1 & 3 `deliberated` → 1/3 automatic). Tell: the *snap* (item 2) is where the reasoning drifted to a T2 evidence-quality caveat (randomization) instead of naming the refuter, while the deliberated U-items were clean — the automatic reflex reaches for study-validity, and the falsifiability concept surfaces only under deliberation. Refresher target: make "can any observation refute?" the automatic first reach, de-conflated from evidence-soundness.
³ Passed 2026-07-16 (blind 3/3) — but only on the **confound + selection** modes the bank's T2 pool covers (E-a…E-d have **no base-rate item**). The 2026-07-19 spaced re-test drew a fresh **base-rate** item (legitimate T2 content, `falsification-curriculum.md` §4.0) and it was **missed** — the rare-condition positive was called "very likely" when P(condition | +) ≈ 2%: base-rate neglect, and **deliberated → still wrong** (a genuine K gap, not mere non-automaticity). The randomized-comparison (Sound) and selection-bias items were **snap-correct**. Net **2/3 = NOT-PASS**; the gate **reopens on the base-rate mode only** — confound/selection held, so the route is a **targeted base-rate refresher + re-test**, not a full T2 re-learn (revocation-by-counterexample, `falsification-curriculum.md` §1/§5). The bank's missing base-rate item is a **curriculum coverage defect** — logged for hand-off (see below). **Re-test #2 (2026-07-19, post-refresher):** rare-case base-rate-neglect is now **solid** — items 1 & 3 correct with sound reasoning (one with a correct ~1/10 estimate) — but the **high-base-rate discriminator** (a *Sound* item: ~50% prior + few false positives → a positive is trustworthy) was called *unsound* ("base rate 50%, so at best 50%"). The learner treated the base rate as a **ceiling** rather than a prior that evidence updates *upward*, answering "unsound" to all three — the overcorrection the cue-decorrelated set is built to catch. Still **2/3 = NOT-PASS**; lever sharpened from generic base-rate-neglect to **base-rate-as-prior / evidence-updates-both-ways**. Effort tags (supplied post-grade): **all three `snap`** — the item-2 miss was *fast-wrong*, so the overcorrected rule ("base rate mentioned → unsound") has **automatized** (correct on the rare cases, wrong on the high-base-rate one, all at reflex speed). The fix must retrain the **reflex** — the rare↔common ⇒ distrust↔trust discrimination — not just add declarative knowledge. **Re-test #3 (2026-07-19, cold, post-refresher):** the overcorrection is **fixed** — the high-base-rate SOUND case was called correctly **on a snap**, with sound reasoning (a reliable positive updates *above* a 70% prior); the rare case was correct too (with a correct ~1/60 estimate). So base-rate reasoning is now demonstrated **in both directions, blind → 2/2 on the valid items → PASS re-earned.** The third item (moderate base rate + noisy test) was **retired as level-drift**: it required integrating base rate × false-positive rate (an **evidence-201** PPV judgment, §4.0), not clean 101 recognition — and the assessor had drifted item difficulty upward across the three sittings (an assessment-integrity note, owned; §2a "retire, don't argue"). Fluency **partially-fluent** (item 1 snap, item 2 deliberated). Durability **unverified** — re-earned same-day post-refresher, so a spaced re-test is still due. The **101↔201 boundary for base-rate/PPV reasoning** is an open curriculum-definition gap (relates #82 · #78).

## Next materialization rung (not built — wu-wei)

A `criteria/`-style **staleness check** that reads the `earned` dates against a decay
window and flags slices due for a spaced re-test — turning `durability: unverified`
and aging `fluent` bands into actionable refresher prompts. This ledger is **rung 1**
(the durable record); the staleness computation is **rung 2** (an instrument that
reads it); an enforced `./check` on ledger well-formedness would be **rung 3**.
