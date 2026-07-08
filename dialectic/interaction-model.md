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

## Concurrency across threads (Operator-directed, 2026-07-07 — now an operating-policy invariant)

The Operator elected **concurrent thread execution** as an operational
invariant (now DYAD.md #5, second invariant): multiple threads work in
parallel across branches and must never collide on a node — a node
in-progress is not claimable by a subsequent thread.

Mechanism (implemented in `bin/ws`; lifecycle ratified on node #16,
2026-07-07 — statuses are the Activity Board lanes, 1:1, and the Operator's
at-a-glance command view; attention = clarification + disposition):

- **Machine state = labels, not body text:** exactly one `status:*` label per
  open node (`clarify → dispose → execute → blocked`); closed = done. Labels
  are queryable in one call and are the claim gate. `clarify → dispose` is the
  Agent's lint-gated `bin/ws converge` assertion; `dispose → execute` IS the
  Operator's disposition (label flip or recorded d-land via `bin/ws dland` —
  off-dispose it warns "Sense not converged" and proceeds, the urgency
  override). Blocked bars execution only — Sense stays permeable, guarded by
  the staleness gate (convergence is timestamped; a dependency closing after
  it invalidates it back to clarify).
- **Lease protocol:** `bin/ws claim <#n> [branch]` — node must be
  `status:execute` (disposition given), lint-clean, not stale, with no active
  lease → post `CLAIM branch=… ts=…` comment → add the `lock:<branch>` label
  (the board-visible holder; the journal stays authoritative) → read back: if
  an earlier active claim by another branch exists, post `YIELD` and drop the
  lock (deterministic earliest-claim-wins tie-break). `bin/ws release <#n>
  [--done | --status s]` verifies the releasing branch holds the lease and
  removes the lock.
- **Branch = thread identity:** one claimed node ↔ one working branch;
  single-writer per node, parallelism across nodes. WIP-N counts active leases.
- **Honesty:** GitHub offers no compare-and-swap; the read-back protocol
  narrows the race to milliseconds and resolves ties deterministically —
  adequate at dyad scale, documented rather than hidden.

## SPAOR grounding (Operator-framed, 2026-07-07)

The model's primitives are not new machinery — they map onto the form's G0
execution scaffold (canonical Sense·Plan·Act·Observe·Reflect), per the third
operating-policy invariant (intent-alignment before action):

- **Sense** — Operator `direct`/`steer` opens it; Agent playback (interpreted
  intent + invariants + design elections) and `elicit` are the Sense moves;
  **Operator confirmation closes Sense** — nothing downstream starts before
  closure. Mechanized (lifecycle #16): nodes enter `status:clarify` (the node
  body IS the playback); the Agent asserts convergence via the lint-gated
  `bin/ws converge` (clarify → dispose); the Operator's disposition (dispose →
  execute — flip or recorded d-land) is the confirmation that releases work.
- **Plan** — dependency placement on the DAG; electing the working branch.
- **Act** — `bin/ws claim` (the lease) → work on the claimed branch.
- **Observe** — `report`/`deliver` with `./check`-style evidence attached.
- **Reflect** — Operator `falsify`/`ratify`; settled records move to
  `reflect/`; breaches forge invariants (see
  `reflect/intent-before-action.md`).

## Directive vocabulary: d-sense · d-land (lifecycle #16, 2026-07-07)

- **d-sense** — the elicitation discipline that drives a node's Sense to
  convergence: rounds of playback + Operator rulings on a `clarify` node;
  output = a contract-passing body; closure asserted by the Agent via the
  lint-gated `bin/ws converge` (clarify → dispose). Elicitation-first
  discipline is Operator-directed (2026-07-07).
- **d-land** — the Operator's disposition directive: dispose → execute,
  recorded via `bin/ws dland`. Default mode: execution dispatched to a
  sub-agent with the node as its sole brief (the node's readiness contract,
  #14, is the dispatchability claim under live test). On a non-dispose node,
  d-land is an urgency override: the Agent states the risk ("Sense not
  converged") and proceeds — warn, not halt (#16 invariant 3).
- **Deprecation trajectory (ratified intent, #16):** d-land is built to be
  deprecated — as execution trust is earned (especially sub-agent delegation),
  disposition flips to standing authorization per stream (the Agent
  self-dispatches on convergence; the Operator's veto stands). Metric from day
  one: Operator disposition-turns per node, derivable as timestamped events
  (`bin/ws turns`).

## Resilient headless execution — carve-out recovery + scope decomposition (#20)

**Provenance:** node #20, converged via d-sense 2026-07-07; four-axis framing,
continue-all-but-gap-dependent, both-owned flat decomposition, and start-light
are all Operator-ratified. Doctrine homes here (#3); the lived proof-of-concept
and the reflection are in `reflect/resilient-headless-execution.md`.

Headless dispatch (d-land's default: a node handed to a sub-agent as its sole
brief, #16) meets reality — an agent mid-execution discovers a gap the Sense did
not foresee. The failure mode to kill is **fail-stop or silent-descope**: halting
the whole delivery on one local blocker, or quietly dropping the blocked part and
reporting success. The frame: the node DAG is refinable at any time, including
mid-execution; **blocking is always local to the finest node, never propagated up
to halt siblings.**

### The four orthogonal guarantees

Per the axis-separation principle (#21 — cited here, *codified there*): four
independent axes, each with its own lever and its own check — not a ranked list,
not a single tradeoff.

- **Integrity** (no false 'done') — a carve-out MUST become a tracked node; a
  delivery cannot close with an un-nodified gap. *Lever:* no-self-ratify on
  scope. *Check:* dispatching-agent verification at close that all ratified
  scope is accounted for (verification discipline today, not yet a hard gate —
  honest limit).
- **Liveness** (forward momentum) — blocking is local; a blocked node never
  stalls its siblings. *Lever:* the per-node claim gate. *Check:*
  `criteria/liveness-local.sh` (blocking one node does not change a sibling's
  claimability).
- **Observability** (Operator visibility) — the carved-out gap surfaces on the
  board the instant it is spun off; the Operator sees it without asking. *Lever:*
  the gap becomes an issue with a `ws:` label. *Check:* it renders in `bin/ws`
  (the generated board).
- **Non-interruption** (agent autonomy) — the agent continues the remainder with
  no Operator disposition; recovery costs the Operator zero turns. *Lever:* the
  carve-out protocol is autonomous, on-branch, reversible.

The visibility-vs-autonomy "tension" is a conflation artifact (#21): you see
everything (observability) and act on nothing (non-interruption) — separate axes.

### Carve-out recovery protocol (reactive)

When a headless agent hits an unexpected gap:

1. **Isolate** the minimal blocked sub-scope — the parts whose correctness
   depends on the gap, and only those.
2. **Continue** all work except the gap-dependent parts (integrity wins
   *locally*, liveness wins *everywhere else* — Operator ruling).
3. **Spin the gap off** as a tracked node (`bin/gh issue create … --label
   ws:<stream>,status:clarify`) capturing what was found — never fold it silently
   back into the parent, never drop it (integrity: no self-ratify on scope).
4. **Report** both the delivered remainder and the spun-off node.

Autonomous (non-interruption); the spun-off node is visible immediately
(observability); the gap is nodified, never descoped (integrity). This is exactly
the recursive test #20 imposes on its own sub-agent.

### Decomposition (proactive) — both-owned, start flat

Large scope is decomposed *before* it blocks, by whoever sees the risk first:

- **Ownership: both.** The Operator decomposes at planning; the Agent proposes a
  split when it detects unbounded scope at convergence.
- **Structure: flat.** Split into sibling nodes joined by `Depends-on:` edges;
  retire the monolith. **No parent/child hierarchy, no board rollup, no aggregate
  states** — deferred until real friction demands them (don't-over-build, #20).
  Flat ⇒ each piece is a normal node under the existing lifecycle; the
  disposition-turn concern is handled by the standing-authorization policy point
  (#16), not new hierarchy machinery.

### Readiness consideration: "scope bounded enough to dispatch"

A converge-time *consideration* on the readiness discipline (#14): before
disposing a node for headless dispatch, ask whether its scope is bounded enough
that a sub-agent can complete it — or whether it should be flat-split first. This
is honestly a **judgment / prompt, not a hard mechanical lint** (unlike #14's
field-presence and dependency checks). It lives in the d-sense/converge
discipline as a question the Agent raises, not a gate the tool enforces; coding
it as a lint would be false precision.

### Sub-agent dispatch-brief template (single home)

Every headless dispatch carries the carve-out protocol in its brief. Single-homed
here; reused when dispatching a node to a sub-agent:

> You are a sub-agent of dyad-chiron. Your entire commission is node #\<N\> — its
> body is your complete brief. This dispatch is context-free by design: the node
> must be sufficient (the readiness contract, #14, under live test).
>
> - Read the node FIRST: `bin/gh issue view <N> --json title,body` and its comments.
> - Self-claim from your worktree: `bin/ws claim <N>`. If refused, report why and stop.
> - Work only on your own branch/worktree. Do not touch protected branches; do
>   not merge (identity acts are the Operator's, dyad-rt-enforced). All git/gh
>   mutations go through `bin/git` / `bin/gh`.
> - **Carve-out recovery (if you hit an unexpected gap):** do NOT fail-stop, do
>   NOT silently descope. Isolate the minimal blocked sub-scope → complete
>   everything not gap-dependent → spin the gap off as a tracked node (`bin/gh
>   issue create … --label ws:<stream>,status:clarify`) → report both. (The four
>   guarantees: integrity · liveness · observability · non-interruption.)
> - Run `./check` before every commit (must exit 0). Trailer every commit `Node: #<N>`.
> - When `./check` is earned and pushed: `bin/ws release <N> --done`, then report:
>   branch, files changed, spun-off nodes, `./check` tail, commit hashes,
>   deviations/blockers stated plainly.

### Curriculum-module stub

*(Draft stub — migrates to the curriculum home when that repo is ratified; kept
here so the #20 deliverable is single-homed with its doctrine. Per the fixed
constraint, the learner-dyad builds its OWN resilience protocol — it does not
adopt ours.)*

**Module — resilient headless execution + decompose-to-isolate-risk.**
Learner-dyad skills:

- rep: dispatch one of your own nodes headless; when it hits a gap, run the
  carve-out (isolate → continue → nodify → report) instead of fail-stopping.
- rep: take a node you could not dispatch (too big) and flat-split it into
  siblings + `Depends-on` edges; retire the monolith.
- rep: prove liveness on your own board — block one node, show a sibling stays
  claimable (your own `check`-style criterion).
- each "taught" claim cites: the learner's carve-out node, its flat-split record,
  its passing liveness criterion — earned by real reps, never conferred.

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
