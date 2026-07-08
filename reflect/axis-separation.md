# reflection: axis separation (the design principle's derivation)

**Provenance:** Operator-ratified as a principle 2026-07-07 ("separating
orthogonal concerns into independent axes as a principle"); nature / reach /
locality converged via d-sense the same day (first-class anchor principle ·
guidance + a cheap substrate check · local-now-propose-later), all
Operator-ratified. Codified as a DYAD.md *Design principles* section (node
#21). This note is the derivation record — the practice the principle was
distilled *from*, kept honest to the anchor's standard: a principle is realized
when it names a reflex already exercised, not decreed ahead of use.

## The principle

**Separate orthogonal concerns into independent axes; never conflate them.**
Conflation forces false tradeoffs and category errors; separation gives each
concern its own representation, mechanism, and check.

**Diagnostic half — an apparent tradeoff is often a conflation artifact.**
Surface the hidden axes and the tradeoff dissolves. The case that surfaced the
diagnostic: *visibility vs autonomy* looked like a genuine tension until it
split into two orthogonal axes — "information *to* you" ⟂ "action demanded *of*
you" — which resolves to see-everything / act-on-nothing. The tradeoff was an
artifact of one word carrying both axes.

## The three lived instances (the practice it was distilled from)

The principle was not invented for #21; it was *named* for #21, after chiron
had already reached for it three times under real friction:

1. **`status:operator` dissolved — actor ≠ stage.** The early status
   vocabulary carried a `status:operator` lane that named *who acts*. That
   conflated the actor with the workflow stage — two different questions on one
   symbol. Separating the axes (#16) left four pure lanes for stage (clarify ·
   dispose · execute · blocked) and moved "whose turn / whose hands" onto its
   own axis. A status label may never name an actor.

2. **`lock:` split from `status:` — holder ≠ stage.** The lease-holder is
   orthogonal to the lifecycle stage. Rather than overload a status with
   holder information, #16 gave the holder its own label family: an execute
   node is `execute` alone (authorized, awaiting a thread) or `execute` +
   `lock:<branch>` (in that thread's hands). Two concerns → two axes → two
   label families, each independently readable and checkable. (Stream
   membership, `ws:<stream>`, is a third such axis.)

3. **#20's four orthogonal protects.** A single "protect" concern pulled apart
   into four independent axes — **integrity · liveness · observability ·
   non-interruption** — each with its own mechanism and its own check, rather
   than one flag pretending to guard all four. This is the principle applied
   forward (design-time), where the first two were applied to dissolve an
   existing conflation (repair-time).

## Grounding on our own substrate

Guidance without a check is exhortation. The cheap substrate grounding is
`criteria/axis-separation.sh`: it asserts our label taxonomy keeps the axes
separate — every `status:*` label is exactly one of the four lanes (no
`status:` names an actor or a holder), holder concerns live only in `lock:*`,
stream only in `ws:*`. Earnedness applied to the principle without
over-building: the principle is grounded where it is cheapest to falsify, on
the taxonomy we already run.

## Candidate Commons-form contribution — DEFERRED

Axis separation reads like a form-level design tenet, not a chiron-local quirk.
But the form's ethos is *realized, not aspirational*: a contribution is earned
by proof across instances, not by plausibility. Three instances inside one dyad
is a strong local signal and a weak cross-dyad one. So this is **flagged as a
candidate, and the proposal is deferred** — not proposed to the form now. It
graduates to a proposal when the principle has demonstrably dissolved
conflations across more instances (ideally beyond chiron's own taxonomy),
governed through `commons/` form-contribution rules at that time.
