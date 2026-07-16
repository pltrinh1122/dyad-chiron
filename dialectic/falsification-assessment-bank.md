# Falsification curriculum — fixed assessment bank + standard keys

> **WHY (provenance — DYAD.md #5).** Operator-directed 2026-07-11 (`raff`): *"generate a
> set of fixed questions with accompanying standard answer keys for the AI coach to grade …
> pass = 3/3; right required, fluency optional."* The **standardized battery** r2 demanded,
> made concrete. Every item conforms to the generation invariants
> (`curriculum-topic-classification.md` §2b); each carries a **standard key** (correct call +
> the reference reasoning the AI coach grades free-response answers against — invariant 5/7).
> An assessment draws **3** from a topic's pool; **pass = 3/3 correct-with-reasoning**;
> correctness gates, fluency is tracked separately (optional). Grows per topic as the ladder
> is built (T0, T1 here; T2+ later).

**Visibility caveat (named, not hidden).** These questions + keys are in the repo, so they are
**not blind** for a learner who reads them. Two mitigations: (1) the items are *objective* —
their answers are *derivable* by anyone who has the skill and *unfakeable* by anyone who
doesn't (the reasoning requirement, not a hidden seed, is the guard), so key-visibility helps
little; (2) for a genuinely blind assessment of a learner who has seen the bank, the coach
generates *fresh* items **to the same invariants** on demand. The bank's job is standardized,
reusable, objective *grading* — not secrecy.

---

## T0 — logic-101 (pool; draw 3, pass = 3/3)

**L1.** *"If P then Q. Q. Therefore P."* — valid or invalid, and name the pattern.
— **Key:** Invalid; **affirming the consequent** (Q can hold for other reasons).

**L2.** *"If P then Q. Not Q. Therefore not P."* — valid or invalid, and name it.
— **Key:** Valid; **modus tollens** (equivalently, reasoning via the contrapositive ¬Q→¬P).

**L3.** Is *"being a mammal"* necessary, sufficient, both, or neither for *"being a dog"*?
— **Key:** **Necessary, not sufficient** — all dogs are mammals (necessary), but not all
mammals are dogs (not sufficient).

**L4.** True or false: *"a valid argument can have a false conclusion"* — and why?
— **Key:** **True** — validity is about *form* (conclusion follows from premises); if a
premise is false the argument is *unsound* and the conclusion may be false. Only a **sound**
argument (valid + true premises) guarantees a true conclusion.

**L5.** Can *"All A are B"* and *"Some A are not B"* both be true? Why?
— **Key:** **No** — they are **contradictories**; exactly one is true.

**L6.** *"Only ticket-holders may enter. Sam entered. Therefore Sam has a ticket."* — valid or
invalid?
— **Key:** **Valid** — *"only ticket-holders may enter"* means enter → ticket-holder; Sam
entered, so Sam is a ticket-holder (modus ponens on the "only" conditional). Tests reading
*"only X may Y"* as Y→X.

## T1 — falsifiability-101 (pool; draw 3, pass = 3/3)

Cue-decorrelated (invariant 6): *qualified* and *sciencey-toned* claims appear among **both**
F and U; *simple* claims appear among both. No surface feature predicts the answer. All items
are clean 101 — no disguised immunizers, unbounded existentials, or multi-construct tangles
(the retired defects, §2a).

**F0 (concept).** State the condition under which a claim is falsifiable.
— **Key:** A claim is falsifiable iff there is at least one **possible/conceivable
observation that would show it false.** (Falsifiability is about the *existence* of a refuting
condition — not whether it is currently checkable, nor already known.)

**F1.** *"Iron is attracted to magnets."* — F or U?
— **Key:** **F** — a possible refuter exists (an iron sample not attracted). *(simple, empirical)*

**F2.** *"There is an energy field around every person that no instrument could ever detect."*
— F or U?
— **Key:** **U** — *"no instrument could ever detect"* rules out any possible refuting
observation (immunized by construction). *(sciencey tone, U — decorrelates tone)*

**F3.** *"This fertilizer increases crop yield by at least 10% within one season."* — F or U?
— **Key:** **F** — measure yield vs a control over one season; a rise <10% refutes it. The
qualification *sharpens* (more testable), it does not immunize. *(qualified, F — decorrelates
"qualified→U")*

**F4.** *"This diet always works; anyone who didn't lose weight simply didn't follow it
correctly."* — F or U?
— **Key:** **U** — self-sealing: every failure is redefined as non-compliance, so no
observation can refute it. *(qualified, U)*

**F5.** *"Reality is, at bottom, mind."* — F or U?
— **Key:** **U** — no possible observation bears on it (metaphysical / no refuting
condition). *(simple, U — decorrelates "simple→F")*

**F6.** *"People who meditate daily have lower average resting heart rates than those who do
not."* — F or U?
— **Key:** **F** — a measurable comparison; finding no difference refutes it. *(empirical, F)*

## T2 — evidence-101 (pool; draw 3, pass = 3/3)

Cue-decorrelated (invariant 6): answers are *not* uniformly "flawed" — at least one item
per assessment is a *sound* inference, so "always spot a flaw" fails. Each key names the
**operative reason** (the specific evidence concept), which the coach must see in the answer —
not just the sound/unsound call.

**E-a.** "Ice-cream sales and drownings rise and fall together, so ice cream causes drowning."
— sound? — **Key:** **Not sound — confound** (a common cause, *hot weather*, raises both).
The operative reason is the *lurking third variable*, not merely "correlation isn't causation."

**E-b.** "In a *randomized* trial the drug group recovered more than the placebo group, so the
drug works." — sound? — **Key:** **Sound (reasonably)** — randomization assigns groups
*impartially*, controlling confounds, so the comparison supports causation. *(the one non-flawed
item — decorrelates "always flawed")*

**E-c.** "A poll taken *at a gym* finds most respondents exercise daily, so most people exercise
daily." — sound? — **Key:** **Not sound — selection bias** (the sample self-selected on the very
trait measured; it is not representative). *(Distinguish from survivor bias — a subtype about
surviving a filter, e.g. only analyzing planes that returned.)*

**E-d.** "Countries that eat more chocolate win more Nobel Prizes, so chocolate boosts
intelligence." — sound? — **Key:** **Not sound — confound** (national *wealth* raises both
chocolate consumption and science funding). *(fresh confound item for re-assessment after E-a is
seen)*

---

## Grading protocol (for the AI coach)

For each drawn item: the learner gives **call + reasoning**. Mark **correct** only if the call
matches the key **and** the reasoning matches the key's *operative reason* (e.g., F2 must cite
the *no-possible-observation* immunizer, not merely "sounds vague"). **Pass = 3/3.** Log the
correctness result to the K-record (`<topic> = pass/not-pass`) and, separately and optionally,
a **fluency** note (effort/latency: snap vs deliberated) — fluency never blocks the pass.
