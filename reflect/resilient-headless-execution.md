# reflection: resilient headless execution — carve-out over fail-stop

**Provenance:** node #20, converged via d-sense 2026-07-07 (Operator-directed:
headless-recovery + decomposition). The doctrine — the four orthogonal
guarantees, the carve-out recovery protocol, flat decomposition, the dispatch
brief — homes in `dialectic/interaction-model.md` (#3). This artifact is the
*why* and the lived proof-of-concept; it moves here per ontology #7 (a record
lands in `reflect/` once the question has earned its answer).

## The problem headless dispatch creates

The lifecycle's default (#16) hands a converged node to a sub-agent as its sole
brief — no live Operator in the loop. That is the whole point (fewer
disposition-turns, the craft telos), but it removes the human who used to absorb
surprises. So the question: when a headless agent discovers a gap the Sense did
not foresee, what does it do without an Operator to ask?

Two bad answers, both common:

- **Fail-stop** — halt the entire delivery on one local blocker. The Operator
  returns to a stalled node and zero progress, when 90% of the work had no
  dependency on the gap at all.
- **Silent-descope** — quietly drop the blocked part, deliver the rest, report
  success. The gap vanishes from the record; a false 'done' is banked; the debt
  surfaces later as a mystery.

Both collapse *four distinct concerns into one decision*. Separating them (the
axis-separation principle, #21) is what dissolves the false choice.

## The four guarantees are orthogonal, not ranked

- **Integrity** — no false 'done'; every gap becomes a tracked node.
- **Liveness** — forward momentum; a blocked node never stalls its siblings.
- **Observability** — the Operator sees the carved-out gap immediately.
- **Non-interruption** — the agent continues with zero Operator turns.

The apparent "visibility vs. autonomy" tension is a conflation artifact: those
are two axes, not two ends of one. You see everything (observability) *and* act
on nothing (non-interruption). A single good mechanism — spin the gap off as a
labeled issue — serves three axes at once (integrity, observability, and, by
keeping the block local, liveness), which is excellence, not coupling.

## The carve-out recovery protocol

Isolate the minimal gap-dependent sub-scope → continue everything else → spin the
gap off as a tracked node (`status:clarify`) → report both. The Operator ruling
that resolves the local conflict: **integrity wins locally, liveness wins
everywhere else** — hold back only the parts whose correctness depends on the
gap; ship the rest.

## Lived proof-of-concept: #13 → #18

The protocol is not theoretical; the dyad already lived it — imperfectly, which
is what makes it instructive.

Building the Activity Board (#13), the agent hit a capability gap: the GitHub
token lacked the `project` scope, so the Projects v2 surface could not be built.
The **right** parts of the guarantee held: the block was *local* — the generated
board view (`bin/ws` rendering the DAG from Issues) shipped and closed; the
Projects-v2 slice was the only thing held back (liveness). The gap was
eventually captured as a full tracked node, **#18** (capability provisioning),
which cleanly separates *capability gaps* (provisionable to the runtime — close
them) from *identity acts* (Operator-reserved by design — do not "fix" them).

The **honest wrinkle:** at the moment of the gap, it was *not* nodified. It lived
only as a line in #13's body ("`project` scope absent → #13 Projects v2 blocked …
only noted in #13's body, never a tracked item") until the Operator later asked
"do we have a job item registered to resolve it?" — and #18 was filed. So #13→#18
proves the *value* of the carve-out (local block, remainder delivered) **and**
demonstrates the exact failure the doctrine now closes: a gap buried in body text
is an integrity leak and an observability miss — the Operator had to *ask* rather
than *see*. #20 formalizes doing the carve-out **at the moment of the gap**, as a
tracked node, autonomously — so no future gap waits on an Operator question.

## Decomposition is the proactive twin

Carve-out is reactive (a gap appears mid-flight). Decomposition is proactive:
when scope is too big to dispatch safely, flat-split it into sibling nodes +
`Depends-on` edges *before* it blocks, and retire the monolith. Both-owned — the
Operator splits at planning, the Agent proposes a split when it smells unbounded
scope at convergence. Deliberately **flat**: no parent/child hierarchy, no
rollup, no aggregate states, until real friction demands them (start-light,
#20). Flat keeps each piece a normal node the existing lifecycle already handles.

## What stays honest (the limits, marked not hidden)

- **Integrity's check is verification discipline, not yet a hard gate.** The
  dispatching agent must confirm at close that all ratified scope is accounted
  for; nothing mechanically *forces* it. Naming this beats pretending the gate
  exists.
- **"Scope bounded enough to dispatch" is a judgment, not a lint.** It is a
  converge-time consideration (#14) the Agent raises, not a check the tool
  enforces. Coding it as a lint would be false precision.
- **Liveness, by contrast, IS mechanically grounded** — because it is already
  structurally true: the claim gate decides a node's claimability from that
  node's own state alone, so blocking a sibling cannot reach it.
  `criteria/liveness-local.sh` proves this and guards against regression.

## Curriculum tie

A module (stubbed in `dialectic/interaction-model.md`): the learner-dyad builds
its *own* resilience protocol — dispatch a node headless, run a carve-out on a
real gap, flat-split a too-big node, and prove liveness on its own board with its
own criterion. Per the fixed constraint, the coach never runs the carve-out *for*
the learner; each "taught" claim cites the learner's own carve-out node, split
record, and passing liveness check — earned, never conferred.
