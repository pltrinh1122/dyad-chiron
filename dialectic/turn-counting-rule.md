# Learning-turn counting rule — the durable spec (SPEC)

> **WHY (provenance — DYAD.md #5).** Operator-converged via d-sense 2026-07-22, built
> under node [#7](https://github.com/pltrinh1122/dyad-chiron/issues/7) (`Node: #7`). The
> craft_telos — *"minimize the learner-dyad's learning-turns to self-sustaining mastery"*
> (DYAD.md craft) — is **unfalsifiable without a counting rule**: "turns are falling across
> reps" is an assertion until *one learning-turn* is defined sharply enough that **two
> independent counters of the same rep agree**. This spec is that definition. It is the
> **rule**; the per-rep record it governs is the ledger at
> [`dialectic/turn-ledger.md`](turn-ledger.md) (spec ⟂ record, mirroring
> `learner-mode.md` ⟂ `k-record.md`). Well-formedness of the ledger: `criteria/turn-ledger.sh`.

## 0. Scope — what this rule counts, and what it must not touch

This rule counts **actual learning-turns spent *within* one rep** — a **cardinal, auditable**
quantity. It deliberately does **not** touch the **ordinal-only** treatment of *predicted
marginal turn-impact across nodes* (the `bin/ws` prioritization legend, closed #47:
"marginal learning-turns aren't cardinally measurable — stay ordinal").

> **Axis separation (DYAD.md design principle).**
> **count-actuals-within-a-rep (cardinal, this rule) ⟂ rank-marginal-impact-across-nodes
> (ordinal, #47).** They are orthogonal axes; #47's ordinal prioritization stands untouched.
> Counting the turns a rep *actually cost* is not the same operation as ranking how much a
> future node *might* move the metric — conflating them would re-import a false tradeoff.

## 1. What is a learning-turn (the unit)

A **learning-turn** is **one learner-Operator ↔ learner-Agent interaction *inside the
practice-curriculum*** (DYAD.md craft_telos unit; Vocabulary #8). Two qualifications are
load-bearing:

- **Inside the curriculum only.** A learning-turn is a **learner-in-curriculum** interaction —
  the learner-Operator practicing or being assessed on a curriculum slice, with the Agent in a
  learner-mode role (`chiron.tutor` / `chiron.assessor` / `chiron.preceptor`). Interactions
  *outside* the curriculum — dyad-chiron's own development, process, or design turns; the
  Operator wearing the *developer* hat to log or fix a curriculum defect mid-session (the
  `learner-mode.md` "log, don't fix" clean-room) — are **not** learning-turns and are **not
  counted** (see §4).
- **Floored above 0** (DYAD.md craft_telos). Zero learning-turns means **no learning
  happened** — it is a category error, not a valid rep economy. A rep with a countable record
  has **≥ 1** turn by construction; never record a rep at `turns = 0`.

## 2. The turn boundary (the rulings — Operator-confirmed, d-sense 2026-07-22)

One learning-turn = **one Operator→Agent round-trip**: one learner prompt **plus** the
Agent's response to it. Three sharp rulings fix the boundary:

- **R1 — a round-trip is one turn.** One learner prompt + the Agent's response to it = **1
  turn**, regardless of the response's internal shape.
- **R2 — a multi-message / tool-call response is still one turn.** If the Agent's single
  response to one prompt spans several messages or issues tool calls (assistant → tool →
  assistant …), that whole response is **1 turn**. Tool calls and continuation messages add
  **0** extra turns.
- **R3 — an Agent-initiated interaction is its own turn.** If the Agent speaks *first* — an
  unprompted clarifying question, an unsolicited offer, a volunteered item — with no preceding
  unanswered learner prompt, that is **1 turn on its own** (it costs the learner an
  interaction to read and dispose).

## 3. The counting procedure (sharp enough that two independent counters agree)

The three rulings reduce to **one countable primitive**. Define a **party-block** as a
**maximal contiguous run of messages from one party** (all consecutive Agent messages — including
tool-call sequences — coalesce into one Agent-block; all consecutive learner messages coalesce
into one learner-block). Then:

> **A learning-turn is exactly one Agent-block inside the rep window.**

Every ruling falls out of this primitive:

- **R1** — a learner-block followed by the Agent-block that answers it: the round-trip owns
  exactly **one** Agent-block → 1 turn.
- **R2** — a tool-call / multi-message response is **one contiguous** Agent-block (nothing from
  the learner interrupts it) → 1 turn.
- **R3** — an Agent-block with **no preceding unanswered learner-block** (Agent speaks first)
  is still one Agent-block → 1 turn.
- **Consecutive learner messages** before any Agent reply coalesce into **one** learner-block,
  so they key the **same** round-trip → they do not multiply turns.
- **A dangling final learner-block with no Agent response** is an *incomplete* round-trip — no
  Agent-block, so **no turn** (the rep either continues or ended there).

**Procedure (per rep):**

1. **Fix the rep window.** From the **first** learner-in-curriculum interaction of the run to
   the **last** (rep-completion / that run's graduation). One rep = **one run through the
   curriculum** (see the ledger). Everything counted must lie inside this window.
2. **Strip non-curriculum interactions** (§4). What remains is the curriculum transcript.
3. **Coalesce into party-blocks** — maximal contiguous same-party runs.
4. **Count the Agent-blocks.** That count is the rep's learning-turns.
5. **Floor check.** The count must be **≥ 1**; a curriculum run that produced 0 Agent-blocks
   did not happen as a rep — flag it, do not record 0.

### The two independent counters (the earnedness bar — DYAD.md `no-self-ratify`)

Agreement is the well-formedness gate, and it is only meaningful if the two counts are
**genuinely independent derivations**:

- **Counter A — machine-derivable.** From a **structured session log/journal**, mechanically
  coalesce same-party messages into blocks and count Agent-blocks in the rep window. No
  judgement about "what a turn is" — pure block-counting on the log. *(A `bin/learn` /
  `bin/ws` helper emitting this is deferred to a first logged rep — see §6.)*
- **Counter B — Operator audit.** The Operator reads the rep transcript and independently
  tallies each distinct Agent "speak" (each round-trip response + each Agent-initiated volley),
  applying §2 by eye — **without** consulting Counter A's number.

Both derive the **same primitive** (Agent-blocks) by **independent means** (mechanical vs.
human read). **If A ≠ B, the rule was applied differently** — the disagreement localizes to a
specific block (a mis-coalesced tool sequence, a mis-classified non-curriculum turn, a
window-boundary dispute) and is reconciled by re-reading that block against §2–§4. **A count
the Agent asserts alone does not close** — earnedness forbids self-ratification.

## 4. Exclusions (what is *not* a learning-turn)

Counted turns must be **learner-in-curriculum**. Explicitly excluded:

- **This dev/build session** and any dyad-chiron self-development, process, or design turns —
  including the turns that *produced* this rule. Miscounting chiron's own build work as a rep
  would confer a rep that was never run.
- **Developer-hat interruptions inside a learner session** — when the Operator or Agent drops
  out of learner-mode to **log or fix a curriculum defect** (`learner-mode.md` clean-room:
  "log, don't fix"). These are design-thread interactions coupled async through shared
  artifacts, not learner practice; they are excluded from the window's count (and their
  presence is noted so the audit and the machine agree on the exclusion).
- **Pure infrastructure interactions** with no learner-Agent curriculum role (a bare
  `bin/learn` orient render that the learner does not respond to is an instrument read, not a
  round-trip — it becomes a turn only when the Agent, in role, presents or grades).

## 5. Worked example — the rule applied (ILLUSTRATIVE ONLY, not a counted rep)

> **Earnedness marker.** This is a **fabricated micro-transcript** built solely to demonstrate
> that the rule is sharp enough for two independent counters to converge. It is **NOT** a real
> curriculum rep and is **NOT** recorded in the ledger. No real rep is being claimed here (see
> §6 / the ledger's status).

A hypothetical assessment-UI rep of one slice:

| # | speaker | message (abbrev.) |
|---|---|---|
| 1 | Agent | "Assessment-UI, help OFF. Here are 3 blind items: …" *(agent-initiated: presents items)* |
| 2 | Learner | "Item 1: A because …" |
| 3 | Learner | "Item 2: B because …  Item 3: C because …" *(second learner message, no Agent between)* |
| 4 | Agent | *(tool: reads k-record)* → *(tool: drafts grade)* → "Graded: 3/3 PASS, fluency fluent. Recording." *(multi-message + tool-call response)* |
| 5 | Learner | "What's the fluency band based on?" |
| 6 | Agent | "The effort-tags you reported plus answer-form. Next slice is T3." |

**Counter A (machine, block-count):** coalesce → Agent-block{1}, learner-block{2,3},
Agent-block{4}, learner-block{5}, Agent-block{6} → **3 Agent-blocks = 3 turns.**

**Counter B (Operator audit, by eye):** turn 1 = Agent presents items (agent-initiated, R3);
turn 2 = learner answers all three items + Agent grades (one round-trip — consecutive learner
messages collapse, R1; tool calls fold in, R2); turn 3 = learner's follow-up + Agent's answer
(round-trip, R1) → **3 turns.**

**A = B = 3.** The rulings that did the work: R2 kept the tool-call grade at one turn; R3
counted the Agent's opening presentation; consecutive learner messages (rows 2–3) collapsed to
one round-trip. A counter who split row 4's tool calls into extra turns, or dropped the
agent-initiated row 1, would disagree — and §2–§3 name exactly which ruling they misapplied.

## 6. Residual edge-cases (refined at first-rep wear)

Per the node contract, residual edges refine at the first real rep. Known open edges, with the
rule's current default:

- **A single response that legitimately shifts topic** (Agent answers, then in the *same*
  uninterrupted block volunteers an unrelated clarifying question) → **1 turn** by the
  contiguity rule (one Agent-block). Flagged: if this proves to under-count real learner cost,
  revisit at wear.
- **Learner-mode ⟂ tutor-mode (help ON) reps.** This rule is stated over the codified
  assessment-UI; the help-ON `chiron.tutor` sub-mode is still v0 Agent-improvised
  (`learner-mode.md`). The block-count primitive is mode-agnostic and should carry over, but is
  unverified there until a tutor rep is logged.
- **Machine counter mechanization.** Whether a `bin/learn` / `bin/ws` helper emits Counter A
  from the session journal is **deferred to the first logged rep** — the structured log it
  would parse does not yet exist (chat transcripts are not persisted in-repo). Until then
  Counter A is defined but not yet mechanized; the ledger records this honestly.
