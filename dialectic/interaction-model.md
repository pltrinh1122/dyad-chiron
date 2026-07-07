# dialectic: the multi-workstream interaction model

**Status: PROPOSED** — Agent-elected candidate, awaiting Operator falsification /
ratification. On ratification + wear-in under real work, the settled parts codify
into `DYAD.md` #5 (concurrency/WIP, proactivity) and #4 (channel discipline), and
this record moves to `reflect/` (ontology #7: a dialectic closes when the question
earns its answer).

**Provenance:** Operator-directed, 2026-07-07 — *"we need to align and agree to an
interaction model that extends the current operator-agent prompt-response to
completing activities across multiple workstreams. this interaction-model build
should also be a part of the curriculum."* Model shape below is Agent-elected,
grounded in the DIP's own open slots (`commons/AGENT.md` dimension #5: "the
Contract leaves these open — you set them, and two dyads may set them oppositely").

## Problem (intent)

Prompt-response couples every unit of progress to one synchronous Operator turn:
one thread, advanced only while both halves attend it. The dyad now has several
concurrent workstreams (substrate, curriculum form, dyad set-up reps, reflection),
so a single-thread model serializes the dyad at the Operator's clock and loses
state between sessions. The goal: complete activities across multiple workstreams
without losing the Contract's floor — the Operator still ratifies, the agent still
never self-ratifies, provenance still grounds every decision.

## The model

1. **Workstream** — the durable unit of work, replacing "the current conversation
   topic". Each carries: intent (problem/goal) · acceptance criteria · execution
   dependencies · status · working branch · provenance. **Single home:
   `WORKSTREAMS.md`** (root ledger — the DAG made durable). A turn is not a
   workstream: one Operator turn may direct, advance, or ratify several; one
   workstream spans many turns and sessions.

2. **Interaction primitives** — what each half's messages do (extends, never
   replaces, prompt-response):
   - Operator: **direct** (new intent → new/changed workstream) · **steer**
     (adjust in-flight) · **ratify** (pass a gate: merge, scope, election) ·
     **falsify** (reject with grounds — a first-class move, per the form's
     Validate family).
   - Agent: **propose** (falsifiable default, never presumed ratified) ·
     **report** (outcome-led checkpoint at natural boundaries; commit = the
     durable form) · **elicit** (blocked on Operator-only knowledge — queued on
     the ledger, never blocking *other* workstreams) · **deliver** (acceptance
     criteria met, with `./check` or equivalent evidence attached).

3. **Autonomy boundary (proactivity slot of #5):** inside a directed workstream,
   the agent proceeds without asking on reversible, on-branch acts. Reserved to
   the Operator: merge-to-main and identity acts (dyad-rt enforces this
   mechanically), scope changes, elections of policy/identity, and
   externally-visible acts. When in doubt: propose or elicit, don't act.

4. **Concurrency (WIP slot of #5):** default **WIP-N = 3** active workstreams
   (Agent-elected, falsifiable — enough for substrate ∥ curriculum ∥ set-up reps;
   more risks shallow Validate passes, inverting 1+1=3 to 1+1=1). Workstreams
   blocked-on-elicit don't count against WIP. The Operator may resize at will.

5. **Resumability invariant — the session-absent test:** all workstream state
   lives in the repo (ledger + branches + criteria + artifacts), never only in a
   session's memory. Check: a fresh session — on any substrate or agent — resumes
   any workstream from the repo alone, no re-briefing. This is the coach-absent
   test's shape applied one level down, and what makes the model portable enough
   to be curriculum.

6. **Substrate shims:** background agents, task trackers, scheduled runs are
   substrate accelerators; the model requires none of them. Anything they produce
   is only real once landed at the workstream's single home. (Same portability
   constraint the Operator set for the curriculum: independent of OS and agent.)

## Acceptance criteria (how we know the model is agreed and real)

- **AC1 — ledger:** `WORKSTREAMS.md` exists; every active workstream carries
  intent + acceptance criteria + dependencies + status + provenance.
- **AC2 — session-absent:** a fresh session picks up an in-flight workstream from
  the repo alone. Test at the next real session restart, not asserted.
- **AC3 — parallel advance:** one Operator turn advances ≥2 workstreams with no
  cross-bleed (each lands on its own branch/commits with its own criteria).
- **AC4 — floor holds:** zero agent-side merges/identity acts under the model
  (dyad-rt criteria keep proving this).
- **AC5 — curriculum-ready:** the model is expressible as practice-reps a
  learner-dyad performs to build *its own* interaction model (see below).
- Enforcement (`criteria/workstreams.sh` — ledger schema + cross-refs) is wired
  **after** ratification, not before: enforcing an un-agreed model would be form
  ahead of spine.

## Curriculum tie-in (Operator-directed)

The interaction-model build becomes a curriculum module — and per the fixed
constraint (the coach never learns *for* the learner) and earnedness, the module
is **the learner-dyad building its own model, not adopting ours**:

- rep: draft your workstream ledger from your live work (not from our template);
- rep: elect your own WIP-N by running into a real overload and resizing;
- rep: run the session-absent test — kill the session, resume from repo alone;
- verification each "taught" claim cites: the learner's ledger, its resize
  record, its passed session-absent test.

Our own build of this model is dog-food rep material (learner #1 = chiron).
Handing a learner our WIP-N or our ledger as *the answer* would be conferral —
the exact shortcut the craft_invariant forbids.

## Open forks for the Operator (falsify here)

1. WIP-N = 3 — right ceiling, or different?
2. Primitive set (direct/steer/ratify/falsify ∥ propose/report/elicit/deliver) —
   too heavy, too light, or wrong cuts?
3. ~~Ledger home~~ — **RESOLVED by Operator falsification (2026-07-07), two
   rounds:** node details live on GitHub Issues (existing cloud-durable
   infrastructure, one node per workstream:
   `github.com/pltrinh1122/dyad-chiron/issues`); the ledger is a **derived
   view generated on the fly by `bin/ws`** — no committed copy exists to drift
   (single-home). Portability note: the model's portable contract is "durable
   node records + a derivable DAG view"; GitHub Issues is this dyad's elected
   *binding* (routed via the `bin/gh` wrapper), swappable per substrate. The
   session-absent test correspondingly gains a cloud-reachability component —
   an elected trade-off: repo-alone gives the mechanism (`bin/ws`), the cloud
   holds the state.
4. Elicit-queueing: batched on the node's `Status:` field and raised at
   checkpoints, vs. interrupt-immediately per question?
