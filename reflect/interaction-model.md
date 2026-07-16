# reflection: the multi-workstream interaction model

**Status: RATIFIED** — audited against the as-built substrate and Operator-ratified,
2026-07-07 (audit node #3; d-sense-converged intent + invariants, fork resolutions
recorded on #3). The audit closes *"built as intended"* only — the model's *efficacy*
still earns through wear-in, not this audit (audit-bar / no-self-ratify invariants,
#3). On ratification the settled parts codified into `DYAD.md` #5 (concurrency/WIP,
proactivity/autonomy-boundary) and #4 (channel discipline), and this record moved
from `dialectic/` to `reflect/` (ontology #7: a dialectic closes when the question
earns its answer). The design↔as-built trace table (below) is the audit's evidence;
`criteria/interaction-model.sh` grounds its now-checkable claims.

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

1. **Workstream (node)** — the durable unit of work, replacing "the current
   conversation topic". Each carries: intent (problem/goal) · acceptance criteria ·
   execution dependencies (`Depends-on:`) · status · working branch · provenance.
   **Single home: one GitHub Issue per workstream** (the cloud-durable node record);
   the DAG/ledger is a **derived view generated on the fly by `bin/ws`** — no
   committed `WORKSTREAMS.md` exists to drift (fork 3, resolved below). A turn is not
   a workstream: one Operator turn may direct, advance, or ratify several; one
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

4. **Concurrency (WIP slot of #5):** default **WIP-N = 3** active workstreams —
   ratified 2026-07-07 (fork 1, below) as the falsifiable default **marked "elected,
   not yet earned"**: this session ran essentially serial, so WIP-N=3 is untested by
   wear and resizes at the first real overload (which is itself the curriculum rep,
   "elect your WIP-N by running into overload"). Enough for substrate ∥ curriculum ∥
   set-up reps; more risks shallow Validate passes, inverting 1+1=3 to 1+1=1.
   Workstreams blocked-on-elicit don't count against WIP; WIP-N counts active leases.
   The Operator may resize at will.

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

## Channel discipline: alignment vs. observation (codified DYAD.md #4)

Two channels, separated by axis (not by convenience) — surfaced by WS-KB (#13,
Operator 2026-07-07) and codified into DYAD.md #4 at this ratification:

- **Chat = the alignment channel.** Synchronous convergence: `direct`/`steer`/
  `falsify`/`ratify` when intent is molten. Costs dyad turns/tokens; reserved for
  work that actually needs both halves attending.
- **Generated views = the observation channel.** The Operator consumes dyad state
  at high bandwidth *without* spending dyad turns — `bin/ws`'s generated DAG/pointer
  render, and **the Observe kanban** (a GitHub Projects v2 board, built this session
  — the concrete realization of the "Operator-observable state surfaces" note on
  #3). The board projects our labels: **`Status` field = the 5 lifecycle lanes** (its
  columns), **`Stream` field = `ws:<stream>`** (its slice — each stream is its own
  board), **`Blocked-by` = open `Depends-on` refs**; swimlanes-by-component are
  deferred ("later", per the governance below). It **supersedes** the interim
  pinned-issue Markdown mirror (#17). Its self-healing auto-sync (label-change
  trigger + daily backstop) is **carved to #25**, not yet built — so the board is
  currently a hand-maintained snapshot (honest limit).

The **deferred-Sense** pattern rides this split: a `status:clarify` node is an open
Sense container — intent + invariants converge *on the node* (body revisions +
comments, over the observation channel) instead of consuming chat turns; the
Operator's disposition remains the closure act. Elicit cadence is keyed to
intent-state (fork 4, below): synchronous when molten, batched-on-node when
convergent (the node body's Elicit queue is the batched home).

## Board governance: no-deferrals / soon-later (Operator-ratified 2026-07-07)

The ledger holds **every node whose intent is live AND whose existence-premise is
valid** — there is no "parked"/"deferred" limbo lane. A node becomes **"later"
(→ archived/closed, not parked)** only when **(a) its intent goes stale OR (b) its
existence-conditions are invalidated**. Both are **discovered on contact, never
predicted** ("we won't know later until it becomes later"). "Soon" is therefore the
*absence of staleness*, not a promise of speed.

- **Critical boundary — invalidated ≠ merely unmet.** An unmet precondition keeps a
  node alive (blocked/waiting); only a premise that *was* valid and *became* invalid
  triggers archival. (This is why #11 was reopened this session: its intent is live
  and its premise unmet-not-invalidated; the earlier "horizon/unscheduled = later"
  reading was retired.)
- **Generalizes the #16 staleness gate** from *convergence* to *intent + premise*: the
  timestamped-convergence reground (a dep closing after convergence → back to
  clarify) is the convergence-scoped instance of the same rule.
- **Enforcement shape (proposed, not built here):** detect-on-touch (re-validate a
  node's intent/premise when next engaged) + a periodic sweep — never forecast.

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

## Directive vocabulary: d-sense · d-land · d-start · d-reflect · riff/raff · todo/idea (lifecycle #16, 2026-07-07; completed #31, 2026-07-09; capture directives #60, 2026-07-16)

The vocabulary is **axis-separated within the section** (#21, *codified there*):
four co-located but non-conflated groups — **lifecycle macros** (act on a node's
life: sense · land · the session frame) ⟂ **session disciplines** (the open/close
retro rituals) ⟂ **mode-prefixes** (set the *discussion mode*, not a lifecycle
action) ⟂ **capture directives** (fast intake — fire a new node mid-workflow
without paying a Sense's interrupting turns). Co-located so the whole vocabulary
reads in one place; separated so the categories don't get conflated into one flat
list.

**Audit note (fork 2, resolved):** `d-start` · `d-sense` · `d-land` are directive
**macros composed from the primitives** (direct + ratify), **not new primitives** —
this keeps the primitive set (section 2) minimal and closed. (The **mode-prefixes**
below are a *distinct* category — see group C — not macros of this kind.)

### A. Lifecycle macros

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
- **d-start** — the **Start Session Discipline**: the session-*open* counterpart
  to `d-reflect`'s *close* (group B). The `{goal/scope}` payload seeds the
  session **goal-frame** — a channel a hook-fired stand-up could not carry. It
  reloads the behavioral guards, runs the mechanical probes, reads the live board
  + resume-pointer + the last reflection's banked **START** commitments, and
  proposes a Next-Best-Action that **Operator confirmation closes**
  (intent-before-action, DYAD.md's third invariant). **Mapped** from dyad-bond's
  `d-start` / `bin/standup.sh`, *not ported* — the protocol is re-derived onto
  chiron's substrate below. Operator-directed 2026-07-08 (*"reference dyad-bond,
  incorporate one for ourself"*).

  **How to resume (the d-start runbook):**
  1. **Anchor** — read `DYAD.md` (the universal instruction layer; the anchor
     the session re-arms against).
  2. **Reload the behavioral guards** — re-arm the operating-policy **invariants**
     and the **axis-separation** discipline (#21); these are the guards every
     action turns on, so d-start is where they re-arm.
  3. **Mechanical probes** — **substrate** (runtime floor present) · **durability**
     (WIP committed/pushed, nothing orphaned) · **anchor-currency** (DYAD.md not
     drifted from what's loaded) · **`./check`** (acceptance criteria green).
  4. **Read the live state** — the board (`bin/ws` / `ws attend`) + the
     **resume-pointer** + the **last reflection's banked STARTs**
     (`reflect/reflections.md`).
  5. **Seed the goal-frame** — from the `{payload}` on the `d-start:` directive.
  6. **Propose an NBA** — a Next-Best-Action the **Operator's confirmation closes**
     (nothing downstream starts before that closure — intent-before-action).

  **Load-bearing symmetry:** *d-reflect writes STARTs ⟂ d-start reads them* — the
  session-close ritual banks forward commitments that the next session-open ritual
  consumes; the two disciplines are the write/read ends of one channel.

  **Axis-separation divergence from dyad-bond:** chiron reads **two separated
  sources** — the board (`bin/ws`, live in-flight state) ⟂ the reflections' STARTs
  (banked commitments) — and therefore needs **no `carry-forward.md`**. Bond
  conflates in-flight work + session hand-off in one ledger (`carry-forward.md`);
  chiron keeps those axes apart (live board vs. banked STARTs), so the hand-off
  ledger dissolves. This is *why* d-start is mapped, not ported.

  **Spine deferred (earnedness / no-form-ahead-of-spine):** a **mechanical spine**
  (`ws start` / `bin/standup`) is **explicitly deferred** — d-start is hand-run as
  prose until hand-running proves friction that a script would remove. Bond's
  `d-start : standup.sh` symmetry is the *referenced form*, not a commitment to
  port the mechanism.

### B. Session disciplines

- **d-reflect** — the **Session-Close Discipline**. Its home is
  **[`reflect/reflections.md`](./reflections.md)** — CSS + SH, including the
  2026-07-09 **evidence-bar + no-miss default** (a Should-Have must clear a
  verbatim-quote-AND-concrete-cost bar; "no miss this session" is a first-class
  expected default). *Point, don't copy:* the discipline lives there; this is the
  vocabulary entry that points to it. **Settled scope (Operator-ratified
  2026-07-09):** **session-wide by default**; `d-reflect: #N` = reflect on that
  node's arc specifically.

### C. Mode-prefixes

A **distinct category** — these set the *discussion mode* (how the Agent should
carry the exchange), **not** a lifecycle action on a node, and are **not** macros
composed from direct + ratify. (Operator-coined + ratified 2026-07-09.)

- **`riff:`** — **diverge**: explore the space, over-generate, expose tensions,
  hold forks open, end open. Do **not** steer toward convergence or force a
  decision. (Read-only exploration to inform a riff is never gated.)
- **`raff:`** — **converge**: steer toward convergence, recommend, and drive to a
  pick/decision (crisp forks are fine here). Naming the mode prevents both failure
  modes — premature convergence killing a riff, endless divergence wasting a raff.

### D. Capture directives

A **distinct category** — *fast intake*. These do **not** act on an existing
node's life (group A), are **not** an open/close ritual (group B), and are **not** a
discussion mode (group C): they **create** a node from an Operator payload fired
mid-workflow, without paying the interrupting turns of a Sense. (Operator-directed
2026-07-10, d-start; the two forks — *one directive* · *new 4th vocabulary
category* — were ruled in this session's chat-based d-sense, node #60.)

- **`todo:` / `idea:`** — **one directive** (`idea:` is an **alias**, not a second
  directive). On `todo: {payload}` (or `idea: {payload}`) the main agent **offloads
  the payload to a sub-agent and immediately continues** its current work; the
  sub-agent nodifies the payload as a `ws:<stream>, status:clarify` node and
  **stops there**. The idea↔todo distinction is **not** modeled by two directives —
  it **rides the guessed `ws:<stream>` label**, settled later by a d-sense when the
  node is pulled off the queue.

  **Non-interruption contract.** On `todo:`/`idea:`, the main agent dispatches the
  capture sub-agent and continues; **the Operator pays zero interrupting turns**.
  This is the **non-interruption** guarantee of #20's four orthogonal guarantees
  (integrity · liveness · observability · non-interruption — see §*Resilient
  headless execution*; *pointed, not copied*), applied **inbound**: Operator-capture
  is the inbound analog of #20's sub-agent-side carve-out (which is outbound).

  **Capture ⟂ falsify invariant.** The capture sub-agent seeds a `status:clarify`
  node from the payload and **STOPS at clarify** — it does **not** run a d-sense,
  does **not** converge, does **not** self-ratify (`no-self-ratify`; DYAD.md #5's
  third invariant — **new nodes enter clarify**). The falsification is a **later
  d-sense**, run when the node is pulled off the queue. Capture is the *fast
  intake*, **NOT** a d-sense — the two are separate acts on separate axes.

  **Sub-agent capture brief (single home).** Mirrors the #20 dispatch-brief
  template (§*Resilient headless execution*); single-homed here, reused when firing
  a `todo:`/`idea:` capture:

  > You are a **capture sub-agent** of dyad-chiron. Your entire commission is to
  > nodify one Operator payload fired mid-workflow (`todo:`/`idea: {payload}`) and
  > **STOP** — you do **NOT** run a d-sense, do **NOT** converge, do **NOT**
  > self-ratify.
  >
  > - Create the node with `bin/gh issue create` (the carve-out pattern), labelled
  >   `ws:<stream>,status:clarify`.
  > - **Intent:** a **stub** written from the `{payload}` — the Operator's words as
  >   the seed intent, **not** elaborated into a converged Sense.
  > - **`ws:<stream>`:** your **best guess** from the payload (the idea↔todo split
  >   rides this label; a later d-sense settles it). Domain model:
  >   `reflect/ws-domain-classification.md`.
  > - **Context:** `captured mid-workflow, {date}`.
  > - **Leave the node in `status:clarify`; do not converge**, do not d-land. A
  >   later d-sense falsifies it when it is pulled off the queue (capture ⟂ falsify).
  > - Report the created node's link and **STOP**.

  **Mechanism (Agent-elected, don't-over-build).** Capture **reuses `bin/gh issue
  create`** (the carve-out pattern; #20 · #51-`intake` is the external dyad-to-dyad
  analog). A dedicated **`bin/ws capture` helper is deferred** — mirroring d-start's
  deferred mechanical spine — until hand-run friction proves a script would remove
  it.

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

## Design ↔ as-built trace (audit node #3, 2026-07-07)

Every intended-model element mapped to its as-built realization and its grounding (a
passing `criteria/` check or a demonstrable live mechanism), or marked deferred /
dropped-with-reason. Conformance is **cited, never conferred** (audit-bar invariant,
#3). Coverage: **13 elements traced — 0 dropped**; 4 carry an honestly-marked
deferred component (each with a reason and, where tracked, a successor node).

| # | Intended element | As-built realization | Grounding (file · check) | Status |
|---|---|---|---|---|
| 1 | Workstream unit (node) | one GitHub Issue per workstream; `bin/ws` renders the derived DAG/pointer view — no committed `WORKSTREAMS.md` | `README.md` structure entry · `criteria/interaction-model.sh` (no `WORKSTREAMS.md`) | built |
| 2 | Interaction primitives (direct/steer/ratify/falsify ∥ propose/report/elicit/deliver) | vocabulary held under real use this session; `d-*` are macros, not new primitives | §2 + Directive vocabulary · `criteria/interaction-model.sh` (primitives documented) | built (fork 2 resolved) |
| 3 | Autonomy boundary (proactivity) | reversible on-branch acts proceed; merge/identity acts Operator-reserved, mechanically enforced | **DYAD.md #5 (codified this node)** · `criteria/dyad-rt.sh` (deny main-mutation, allow working-branch) | built + codified |
| 4 | Concurrency / lease | `status:*` lane labels + `lock:<branch>` + CLAIM/RELEASE/YIELD journal; single-writer per node | `bin/ws` · **DYAD.md #5 2nd invariant** · `criteria/ws-lifecycle.sh` · proven live on #5 | built |
| 5 | Resumability (session-absent) | all state in repo + cloud Issue records; `bin/ws` re-derives view | AC2 — verification discipline; efficacy earns at next real session restart | built · **wear-in test pending** (honest limit) |
| 6 | Substrate shims | model requires none; substrate output is real only once landed at the single home | doctrine (§6) — no mechanism by design | built (as principle) |
| 7 | SPAOR grounding | primitives map to Sense·Plan·Act·Observe·Reflect; mechanized via lifecycle #16 | **DYAD.md #5 3rd invariant** · `reflect/intent-before-action.md` · `criteria/ws-lifecycle.sh` | built |
| 8 | Directive vocabulary (d-sense · d-land) | `bin/ws converge` (lint-gated) · `dland` (DISPOSITION journal) · `turns` (metric) | `criteria/ws-lifecycle.sh` (converge/dland/warn-not-halt) · DYAD.md #8 | built |
| 9 | Resilient execution (carve-out + flat decomposition) | blocking local to finest node; four orthogonal guarantees; carve-out protocol | `reflect/resilient-headless-execution.md` · `criteria/liveness-local.sh` (liveness) · `criteria/axis-separation.sh` | built (liveness) · **integrity = verification discipline, not a hard gate** (honest limit, #20) |
| 10 | Channel discipline (alignment vs. observation) + Observe kanban | chat = alignment, generated views = observation; Projects v2 board projecting labels | **DYAD.md #4 (codified this node)** · `criteria/interaction-model.sh` | codified · **auto-sync deferred → #25**; board hand-maintained today |
| 11 | Board governance (no-deferrals / soon-later) | board = live-intent ∧ valid-premise; "later" = intent-stale ∨ premise-invalidated, discovered-not-predicted | §Board governance; generalizes the #16 staleness gate | doctrine landed · **detect-on-touch + sweep enforcement proposed, not built** |
| 12 | Earnedness close gate | `bin/ws release --done` refuses while any AC box is unchecked | `criteria/earned-done-gate.sh` (#26) | built |
| 13 | Readiness contract (dispatchability) | node field-presence + dependency lint; the `status:dispose` flip-gate self-heals | `criteria/ws-lint.sh` · `.github/workflows/node-lint.yml` (#14) | built |

## Acceptance criteria (how we know the model is agreed and real)

- **AC1 — ledger:** one GitHub Issue per workstream (no committed `WORKSTREAMS.md`);
  every active node carries intent + acceptance criteria + dependencies + status +
  provenance, and `bin/ws` renders the derived DAG/pointer view on the fly.
- **AC2 — session-absent:** a fresh session picks up an in-flight workstream from
  the repo (+ the cloud node records) alone. Test at the next real session restart,
  not asserted.
- **AC3 — parallel advance:** one Operator turn advances ≥2 workstreams with no
  cross-bleed (each lands on its own branch/commits with its own criteria).
- **AC4 — floor holds:** zero agent-side merges/identity acts under the model
  (dyad-rt criteria keep proving this).
- **AC5 — curriculum-ready:** the model is expressible as practice-reps a
  learner-dyad performs to build *its own* interaction model (see below).
- Enforcement (`criteria/interaction-model.sh` — grounds the model's now-checkable
  claims: no committed `WORKSTREAMS.md`; primitive/vocab/WIP claims documented where
  stated; the DYAD.md #4/#5 codifications present) is wired **at** ratification (this
  audit, #3), not before: enforcing an un-agreed model would be form ahead of spine.

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

## Open forks (all resolved — d-sense #3, elicitation-first, 2026-07-07/08)

1. ~~WIP-N = 3~~ — **RESOLVED (ratified as proposed):** WIP-N=3 is the falsifiable
   default **marked "elected, not yet earned"** — this session ran essentially
   serial, so it is untested by wear and resizes at the first real overload (itself
   the curriculum rep "elect your WIP-N by running into overload"). See section 4.
2. ~~Primitive set~~ (direct/steer/ratify/falsify ∥ propose/report/elicit/deliver) —
   **RESOLVED (ratified as-is):** the set held under real use this session. Audit
   note: `d-start`/`d-sense`/`d-land` are directive **macros** composed from the
   primitives (direct + ratify), **not new primitives** — the set stays minimal (see
   Directive vocabulary).
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
4. ~~Elicit-queueing~~ — **RESOLVED (ratified keyed to intent-state):** synchronous/
   interrupt when intent is molten (high-bandwidth falsification), batched-on-node
   when intent is convergent. The node body's Elicit queue is the batched home; chat
   is the synchronous channel. See Channel discipline.
