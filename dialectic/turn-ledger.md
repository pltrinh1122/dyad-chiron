# Turn-ledger — per-rep learning-turn economy

> **WHY (provenance — DYAD.md #5).** Operator-converged via d-sense 2026-07-22, built under
> node [#7](https://github.com/pltrinh1122/dyad-chiron/issues/7) (`Node: #7`). The pedagogy
> engine's **durable record of per-rep economy** — how many learning-turns each run through the
> curriculum cost — so the craft_telos claim *"turns are falling across reps"* becomes
> **observable**, not asserted. Counting is governed by the durable rule at
> [`dialectic/turn-counting-rule.md`](turn-counting-rule.md); this file is the **record** (spec ⟂
> record, mirroring `learner-mode.md` ⟂ `k-record.md`). Well-formedness: `criteria/turn-ledger.sh`.
>
> **Distinct axis from the K-record (axis separation — DYAD.md).** `k-record.md` tracks
> **per-slice *mastery*** (gate + fluency); this tracks **per-rep *economy*** (turns spent).
> Mastery and economy are orthogonal — a learner can master a slice cheaply or expensively — so
> this is **its own artifact**, deliberately **not** folded into the K-record.

## Reading rules (grounded in `turn-counting-rule.md`)

- **A rep = one run through the curriculum** (v0 = one dyad set-up: anchored + improvement loop
  wired + birth recorded). Reps are ordered by `earned` date; **mastery = declining `turns`
  across successive reps** (the telos made observable).
- **`turns` = the count from the rule** (§3): Agent-blocks inside the rep window, learner-in-
  curriculum only. **Floored above 0** — a rep is never recorded at 0 turns (zero = no learning
  happened).
- **`turns` is earned only when `agree = yes`** — the two-counter bar (`no-self-ratify`):
  `machine` (Counter A, from a structured session log) **must equal** `audit` (Counter B,
  Operator read). A row whose counts disagree, or that carries only one count, is **`agree =
  no` / provisional** — the number is not yet earned and must not be read as a trend point.
- **Cardinal-within ⟂ ordinal-across (#47).** These counts are cardinal, per-rep, and auditable.
  They do **not** feed the `bin/ws` ordinal prioritization of predicted marginal impact across
  nodes — that axis (#47) stays untouched.

## Ledger — learner: Operator (dyad-chiron, class-of-one)

| rep | curriculum-run | earned | machine (A) | audit (B) | agree | turns | notes / provenance |
|---|---|---|---|---|---|---|---|
| — | — | — | — | — | — | — | *No countable rep logged yet — see status below. Schema seeded; first row lands on the first curriculum rep with a structured session log.* |

## Status — AC #3 (two-counter agreement on a real rep): NOT YET EARNABLE

The counting **rule** (deliverable 1) and this **ledger schema** (deliverable 2) are delivered
and enforced. The **two-counter agreement on a real rep** (deliverable 3 / node invariant 2) is
**not yet earnable**, and the row above is honestly left empty rather than fabricated:

- **No real curriculum rep has a countable record.** A learning-turn is a **learner-in-
  curriculum** interaction (`turn-counting-rule.md` §1/§4). The repo's real learner activity —
  the T0–T2 assessment sittings in `k-record.md` (`logic_101`, `falsifiability_101`,
  `evidence_101`, 2026-07-11/07-16) — are recorded only as **retrospective reflections**
  (`reflect/reflections/`), which summarize the arc but **do not preserve turn-by-turn round-
  trips**. dyad-chiron's own build/design/process sessions (including the one that produced this
  ledger) are **excluded by construction** (§4) — counting them would confer a rep never run.
- **Counter A has no input yet.** The machine count requires a **structured session
  log/journal**; chat transcripts are not persisted in-repo (verified: no `*.jsonl` / journal
  artifact exists). Until a rep is run *and logged*, Counter A cannot be derived, so agreement
  cannot be demonstrated on a real rep.
- **The rule's sharpness is nonetheless demonstrated** — `turn-counting-rule.md` §5 shows two
  independent counters converging (A = B = 3) on an **illustrative** transcript, explicitly
  marked *not a real rep*. This proves the rule is counter-agreement-ready; it does **not**
  satisfy the earnedness bar, which requires a **real** logged rep.

**Recommendation (Operator disposition):** AC #3 awaits the **first logged curriculum rep**. Two
paths, either acceptable:
1. **Extend `bin/learn`** to emit Counter A (Agent-block count) into a session log at rep time,
   then run one real rep and have the Operator audit it — closing AC #3 in place on this node.
2. **Carve AC #3 to a successor node** ("first-logged-rep two-counter agreement"), depends-on #7,
   so #7 can close on deliverables 1–2 (rule + ledger machinery) without conferring an unearned
   agreement.

Leaving AC #3 unchecked is the honest state, not a gap — per DYAD.md, an unmet precondition
keeps the criterion alive (blocked/waiting), and earnedness forbids fabricating the rep.

## Next materialization rung (not built — wu-wei)

Mechanizing **Counter A** — a `bin/learn` / `bin/ws` helper that parses the session journal,
coalesces party-blocks (`turn-counting-rule.md` §3), and writes the `machine (A)` column at rep
time. This ledger is **rung 1** (the durable record + schema); the machine counter is **rung 2**
(the instrument that feeds column A); the enforced `criteria/turn-ledger.sh` well-formedness gate
is **rung 3** (shipped with this node).
