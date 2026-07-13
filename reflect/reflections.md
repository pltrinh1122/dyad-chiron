# reflections — chiron's session retros (CSS + SH)

> Chiron's `d-reflect` ledger. Form adapted from **dyad-bond**'s reflection
> discipline (`kb/reflection-discipline.md`), with a chiron-local divergence.
>
> - **CSS (Agent, on the Agent):** **CONTINUE** (a pattern worth keeping) ·
>   **START** (a commitment going forward) · **STOP** (a failure named and
>   corrected).
> - **SH (Agent, on the Operator — by the Operator's standing permission):** the
>   Operator invites the Agent to falsify the Operator's *prompting* along two
>   axes — **intent clarity** (was the intent ambiguous?) and **coherence** (did
>   the Operator actually mean it?). **Should Hold** = prompting that worked, keep
>   it; **Should Have** = a prompting miss, flagged. Verbatim-quote-grounded.
> - **Should-Have gate + no-miss default (ratified 2026-07-09, from an Agent failure
>   — three sessions of a manufactured miss).** A **Should-Have must clear an evidence
>   bar: a verbatim quote AND a concrete cost it caused.** A quote without a cost is
>   not a miss (the recurring `d-reflect`-scope flag: quoted, but decoded correctly
>   every time → no cost → not a miss). **"No miss this session" is a first-class,
>   expected default** — SH *presumes* no miss unless one clears the bar; an empty
>   Should-Have is a correct outcome, never a slot to fill. *Why it's structural, not
>   willpower:* filling the slot with a fabricated miss is **conferral-in-reverse** —
>   it defeats SH (the anti-sycophancy guard) exactly as flattery does. The evidence
>   bar makes the honest default the path of least resistance, and re-routes the
>   completion drive to *emit the sentinel* ("no miss") rather than invent content —
>   an explicit `none` value in the enum, not an out-of-band null.
>
> **Divergence from bond:** bond's OR credits the Operator's conduct as a tag on
> CONTINUE, and its (candidate) SH is *Operator-authored* self-reflection. Chiron
> **drops OR** and repurposes **SH** as *Agent-authored feedback on the Operator's
> prompting, by standing permission* — the covalent move (the Operator opens their
> prompting to falsification, guarding against the Agent's sycophancy). First real
> instance of bond's zero-instance SH grammar, evolved on a cross-dyad rub.
>
> No ratification ceremony — durable by being written and committed. Full text
> always shown in chat (presentation ⟂ durability). DYAD.md ontology reserves
> *reflections* for our retros (never "lessons" — that's curriculum).

---

## 2026-07-07 — earnedness gate · no-deferrals · Observe kanban · interaction-model audit

Session arc: d-start diagnostic → diagnosed the #13→#18 decomposition gap →
built the #26 earnedness gate (PR #27, merged) → falsified the no-deferrals /
soon-later model → built the Observe kanban (Projects v2) → d-sense #3 (audit
node, dispatched + verified, PR #28) → d-sense #25 (paused at convergence).

### CONTINUE *(Agent)*
- **Axis-separation as the first diagnostic.** It located the #13→#18 gap
  precisely (capability ⟂ deliverable, conflated in the carve-out) and caught my
  own #11 over-archival (contingent ≠ stale). Ask "which orthogonal axes got
  conflated?" before proposing a fix.
- **Elicitation-first d-sense — intent → invariants → design, forks held.** On #3
  it surfaced the "audit node" reframe a design-first pass would have skipped.
- **Test whether a proposed mechanism should be *removed*, not just separated.**
  My horizon-lane proposal was the wrong shape; deleting the deferred axis beat
  separating it. Keep the "delete, don't add" option live when designing.

### START *(Agent)*
- **Provision sub-agent context via node / pointers / prompt — reserve inline for
  stated cause.** (Saved as a durable memory this session.)
- **Treat hand-patched drift as a gap signal, not a workflow.** Every manual board
  fix this session (#3, #26 cards) was #25 announcing itself — name the gap.
- **Stamp dates from the actual clock; verify dates in delivery review.** (STOP #3.)

### STOP *(Agent)*
- **Defaulting to inline with a rationalization.** On #3 I chose inline and
  justified it ("context not durable") — bypassing the dispatch discipline; the
  Operator corrected it. The fix was provisioning context, not going inline.
- **Inventing parallel numbering.** "Move 1/2/3" collided with node numbers and
  confused the Operator. Refer to nodes; don't mint private schemes.
- **Trusting a sub-agent's factual stamps.** The #3 delivery dated everything
  2026-07-08 (actual: 2026-07-07); caught, but only on a second verification pass.

### SH *(Agent on the Operator's prompting — intent clarity · coherence)*

**Should Hold** *(prompting that worked — keep it)*
- **Scoping your input to what's yours, and handing off the rest.** *"i can only
  comment on the intent and that is that the board should be automatically updated
  for any changes to gh-issue states"* (#25) — you named the boundary of your own
  knowledge and asked me to explain the mechanism instead of bluffing past it.
  High clarity, high coherence; it kept mechanism forks off your plate.
- **Falsifying my first plausible answer instead of accepting it.** The whole
  soon-later sequence — you refused each crisp-but-premature definition I offered.
  Coherent and deliberate ("gaining clarification through this falsification
  process"); it's the guard against my sycophancy. Keep doing it.
- **Interrogating the form itself** — *"any operator reflection in the START and
  STOP section?"* improved the discipline by questioning it, not just using it.

**Should Have** *(prompting misses — flagged, per your permission)*
- **Intent clarity:** the soon/later intent arrived under-specified. *"anything
  later will be archived/closed"* used a *temporal* word for what you ultimately
  meant as a *staleness/validity* condition — it took four rounds to separate the
  three senses of "soon" (fast · committed · not-stale). Coherence was fine (you
  were deliberately discovering it), but naming the axis you were reaching for
  earlier would have compressed the path.
- **Coherence (shared-definition gap):** *"let's drop the OR and only keep the
  SH"* was coherent in your head but assumed a shared definition of "SH" we didn't
  have — I inherited bond's (Operator-authored self-reflection); you meant a
  repurposed SH (permission for my feedback on your prompting). I built the wrong
  scaffold first. One line pinning "SH = you critique my prompting" would have
  pre-empted the misread.

---

## 2026-07-08 — the #25 arc: board self-maintenance, disposition-scope, d-start

Session arc: `d-start` (codify the Start Session Discipline, ref. dyad-bond) →
filed #31 → surfaced two board-integrity bugs (stranded `status:` labels on
closed nodes #26/#2; then the Projects-v2 card drift that vindicated the
original "#3 stuck in execute" flag) → grew #30 into the full status-integrity
node → `d-sense: #25` (auto-sync, journaled) → `d-sense: #18` (decomposed into
#34 secret-slice + #35 bin/ratify; #18 → posture node) → `d-land: #34`
(sub-agent dispatch, earned close via carve-out) → two invariant refinements
merged (PR #32 soften-inv-3 + group; PR #36 fifth invariant) → todo #37
(dip-convergence exemplar). Four hand-patches of the board along the way.

### CONTINUE *(Agent)*
- **Axis-separation is now the reflexive first move — 2nd session as the
  workhorse.** It split transport ⟂ detection (#25 vs #30), capability ⟂
  identity (#18), gh-state ⟂ lifecycle-status ⟂ projection-status (the status
  bug), enablement ⟂ reserved-act-UX (#35). It located every fix precisely.
  *Ingraining note:* n=2 as the lead diagnostic — a candidate to stop
  reflecting on and treat as settled reflex.
- **Falsify-before-trust on merges and flags.** *"i've merged. falsify."* caught
  the interaction-model settle (`dialectic/` → `reflect/`) that had gone stale in
  #31's body; falsifying *"#3 ... left in execute"* found the real offenders
  (labels on #26/#2 + the Projects card) rather than the node named. Looking at
  the target before trusting the description paid every time.
- **Provisioning the sub-agent, not inlining, on d-land #34.** Dispatched with a
  complete brief per last session's banked START; it executed the earnedness
  carve-out honestly (removed the unearned criterion, did not false-check it).
  Directly redeems last session's inline STOP.

### START *(Agent)*
- **Dispose mechanisms; reserve Operator forks for intent + invariants.** The
  fifth invariant, now codified. Stop routing mechanism choices (where a lint
  homes, which node absorbs a criterion, how to encode an edit) to Operator
  disposition.
- **Never self-advance a node's lifecycle.** `ws converge` only *records* a
  convergence the Operator's d-sense reached — it is not mine to run off a merge
  plus my own playback. Softened invariant 3 is the codified guard.
- **Hand-patching the board is a gap signal, not a workflow — I hit it 4× this
  session.** The mechanism (#25 auto-sync) is now unblocked (#34's secret is
  live). Building it is the NBA; stop patching cards by hand.

### STOP *(Agent)*
- **Self-advanced #31 via `ws converge`** off a merge + my own playback, no
  Operator d-sense. Caught by you in-band; corrected in the anchor.
- **Over-consulted on mechanisms.** Several fork-questions this session (lint
  home, runbook home, decompose) were mine to settle, not yours to dispose. The
  fifth invariant is the fix; the habit is mine to break.
- **Leaked `#29` into #31's `Depends-on` line** (a prose discharge-note), which
  the readiness lint parsed as an open dependency and refused converge on. Keep
  the `Depends-on` line clean of prose refs.
- **Re-created a merged-and-deleted branch** with a stray `git push` after you
  merged PR #32. Check PR/branch state before pushing to a branch that may be
  gone.

### SH *(Agent on the Operator's prompting — intent clarity · coherence)*

**Should Hold** *(prompting that worked — keep it)*
- **Flagging a bug by pointing, even when the pointer is imprecise.** *"[PROCESS
  BUG] node #3 was closed but status was left in `execute`"* — #3's *labels* were
  actually clean, but the finger pointed at a real bug (the Projects-card drift)
  I would have missed. The imprecise-pointer-plus-*falsify* beat a
  precise-but-absent report. Keep flagging on instinct and letting me falsify to
  the real locus.
- **Correcting process the instant it drifts, in-band.** The two mid-work
  interrupts — *"[PROCESS-INVARIANT] i only dispose nodes carrying `clarify` ...
  and `dispose` ..."* and the disposition-scope directive — didn't wait for a
  turn boundary. That kept the invariants forming from live breaches (their
  intended origin), not from theory.
- **Stating the invariant, leaving me the encoding.** *"add/edit ...: operator
  disposition focused only on intent and invariants. mechanisms should be
  disposed by agent ..."* — you disposed the invariant (yours) and left file,
  number, and wording to me (mine). That is the fifth invariant, demonstrated in
  the act of creating it. Highest-coherence prompt of the session.

**Should Have** *(prompting misses — flagged, per your permission)*
- **Intent clarity — `d-reflect: 25` scope is ambiguous.** `d-sense`/`d-land`
  take a node; `d-reflect` (per this ledger) is a *session* retro. "25" could
  mean "reflect on the #25 arc" or "the session, anchored on #25" — I read the
  latter. One settled convention — does `d-reflect` take a scope arg, or is it
  always session-wide? — removes the guess.
- **Intent clarity — "reference dyad" arrived as a trailing fragment** in the #37
  todo. I inferred "a reference-dyad study specimen" from `dip-convergence.md`'s
  own vocabulary; coherent in your head, but naming whether it's a *quality* or a
  *pointer to a specific peer* would have saved a clarify round. Same shape as
  last session's "soon/later" and "SH" under-specification.

---

## 2026-07-08 (session b) — #25 executed: Projects v2 self-healing sync built, CI-proven, closed

Session arc: `d-start` (goal = complete #25) → probed state, played back intent +
ACs, surfaced one mechanism I'd dispose (re-point `Depends-on` #18→#34) + one
Operator-item (retain/retire the interim markdown surface) → **`d-sense: ratify
(go)`** → recorded convergence + disposition (`ws converge`/`dland`), claimed,
built `bin/ws sync-project` (GraphQL; resolve-by-title so no magic IDs; lane map;
done-cap-via-archive; `--fixture` offline + `--plan` live diff) + `activity-board-
project.yml` + `criteria/activity-board-project.sh` → live-proved drag-revert;
discovered + documented the auto-add/#33 churn → **PR #39 with an honest 4/6-earned
checklist**, lease released, node held OPEN (earnedness) → Operator merged → earned
**AC2 + AC4 on real post-merge CI runs**, gated close (`release --done`, no
stranded label). One node, opened and closed in a session.

### CONTINUE *(Agent)*
- **Earnedness enforced against myself, not just claimed.** Held #25 in execute and
  refused to check AC2/AC4 or close until real post-merge CI runs proved them
  (runs `28981241179`, `28981203978`), then checked the boxes *with run-ID
  evidence*. The gate refused `--done` on the two unearned boxes and I let it —
  the craft value made mechanical in my own conduct, not just in the tooling.
- **The fifth-invariant division held — mechanisms disposed, only intent+ACs put to
  you.** Dependency re-point, resolve-by-title, done-cap-via-archive, loop-guard —
  all mine to settle; the single d-sense ask was intent+ACs. Directly redeems last
  session's over-consultation STOP.
- **Never self-advanced the node.** Explicit `d-sense: ratify` *before* `ws
  converge`; converge only *recorded* your convergence. Redeems last session's
  self-advance STOP.
- **Live testing caught the idempotency bug.** Running the sync twice surfaced that
  archived items were re-archived every run; fixed with `isArchived` tracking.
  Build-and-probe beat trust-the-first-pass.

### START *(Agent)*
- **Probe a projection's *steady state* against external actors before calling it
  clean.** I wrote "board is currently clean" in the PR, but GitHub's built-in
  auto-add re-injected #33 twice afterward. The immediate post-apply snapshot ≠
  steady state when another automation writes the same surface. Check for external
  writers before claiming a stable end-state.
- **Hold a lease through to *done* when I'll personally close the node — or state
  why I'm releasing.** (See STOP.)

### STOP *(Agent)*
- **Released the #25 lease at "branch work pushed," then had to re-claim a
  merged-and-deleted branch to run the gated close.** The gated `release --done`
  needs a live lease, but the terminal ACs were only earnable *post-merge* (CI),
  when the branch was gone. Re-checking-out the local branch worked, but it's a
  smell — and a *model* observation, not just a personal one: **the lease/close
  protocol has a gap for nodes whose terminal ACs are CI-proven post-merge — the
  lease releases at merge, the close needs it back.** Candidate: a close path
  gated on earnedness that does not require a live lease. Flag for a process node
  if it recurs.
- **Mild overclaim — "board is currently clean."** Named above; the fix is the
  START (probe steady state, including external writers).

### SH *(Agent on the Operator's prompting — intent clarity · coherence)*

**Should Hold** *(prompting that worked — keep it)*
- **`d-sense: ratify (go)`** — one crisp token closed Sense after the playback,
  trusting the mechanism-dispositions I'd surfaced without relitigating them. That
  is the fifth-invariant division working from your side: you disposed intent+ACs
  and left the mechanisms to me. Highest-leverage prompt of the session.
- **`i merged PR #39`** — a clean factual handoff that unblocked the CI-proof phase
  with zero ambiguity about state. You merged the *earned* deliverable after
  reading the honest earned-vs-pending split, delegating the CI-gated close to me —
  validating that surfacing honest limits (not overclaiming "done") is the right
  move. Keep acting on the honest-limits framing.

**Should Have** *(prompting misses — flagged, per your permission)*
- **This session's prompting was minimal and clean — no new intent-clarity or
  coherence miss to flag, and I won't manufacture one** (that would be conferral in
  reverse). The single standing gap is a *recurring carryover*, not new: **`d-reflect`
  scope is still unwritten.** You said bare `d-reflect`; I read session-wide (the
  ledger default) — correct, but the convention remains a standing guess, flagged
  last session too. One line — does `d-reflect` take a scope arg, or is it always
  session-wide? — settles it. Natural home: **#31** (d-start codification), which is
  already pinning the directive vocabulary.

---

## 2026-07-09 — ws:* domain taxonomy → decision architecture (CQRS) → Classification O built

Session arc: riff on `ws-*` workstream tagging → landed the four-domain `ws:*` 2×2
(#43; #5 conflation split → #44) → riff/raff design of the domain axis (explored
`type×dest`, then superseded) → surfaced the top-level insight, **decision-first
classification** (enumerate the decisions the classification drives *before* the
facets) → codified the **two-classification CQRS decision architecture** + the
evaluation instrument (#48, `reflect/decision-architecture.md`) → built
**Classification O**, the attention read model: #47 (C1 filter + importance =
`telos-lever` × DAG-criticality) → #51 (inbound DM falsification intake —
`ws intake`/`ws decline`) → #52 (importance-primary + **stagnation** anti-starvation
ranking; Eisenhower retired). The urgency axis ran a full falsification loop —
importance-primary → external-SLA → the `commons/falsification/CONTRACT.md` §H
*no-SLA* contract → landed on **stagnation**. Captured #46 (land-before-pivot),
dogfooded twice. Five nodes opened + closed; PRs #45/#49/#50/#54/#55 merged.

### CONTINUE *(Agent)*
- **Read the governing artifact, then let it falsify the plan.** The urgency design
  bent to one primary source — `commons/falsification/CONTRACT.md` §H ("no SLA,
  decline-free"). I stopped and surfaced its collision with your ruled Fork 2 rather
  than converging it, and the contract reshaped the design (→ stagnation). Same
  *falsify-before-trust* as prior sessions, now against an external spec.
- **Elicitation-first d-sense held across five nodes** — intent → invariants → held
  forks, mechanisms disposed for visibility. It surfaced the real fork each time
  (the #5 conflation-split, `telos-lever` grounding, the age-clock). Only
  intent/invariant forks went to you (fifth invariant).
- **Sub-agent dispatch with node-as-sole-brief; verify every build before handoff.**
  Four builds (#43/#47/#51/#52) dispatched with pointers, each verified live
  (`ws attend`/`ws intake` run, labels/PR/boxes checked) before I presented. Inline
  reserved for the #48 codification with *stated cause* (this session's dialogue is
  not pointer-provisionable). Redeems the standing inline STOP.

### START *(Agent)*
- **Open the governing contract at first reference, not three turns later.** I read
  `commons/falsification/CONTRACT.md` only when you pointed at the backlog; its §H
  would have reshaped Fork 2 two turns earlier. When a fork rests on an external
  contract/spec, read it at first mention.
- **Keep a node's acceptance criteria inside that node's own scope.** I folded #52's
  ranking deliverable into #51's box 2 — a criterion #51 could not earn alone. Catch
  a cross-node criterion at authoring, not at close.
- **Codify directive vocabulary in the substrate, not private memory.** `riff:`/`raff:`
  landed in my cross-session recall, not `reflect/interaction-model.md` — the *same*
  unwritten-in-substrate gap I'd been mis-flagging on `d-reflect`. Directive conventions
  belong where the dyad shares them, not in my head; memory is a stopgap, not the home.

### STOP *(Agent)*
- **Mis-scoped #51's box 2** — wrote "ordered by the #52 model" as a #51 acceptance
  criterion, coupling #51's close to #52's deliverable. The sub-agent correctly left
  it unchecked (its honest partial); I rescoped and re-checked. Named as the START
  above; the failure was authoring a criterion across the node boundary.
- **Manufactured a recurring Operator prompting-miss — three sessions running.**
  I filed "`d-reflect` scope unwritten" under *Should-Have* thrice, but I infer the
  scope correctly every time — so the *prompting* works; what is unwritten is the
  *substrate codification* (#31), not your intent. Flagging it as a prompting miss is
  *conferral-in-reverse* — the exact failure the SH discipline names — repeated. Caught
  by the Operator's SH-on-my-SH (the covalent guard run back on me). Fix: reclassified
  below, and codify the vocabulary rather than re-flag it.
- **Claimed a landing without verifying merge state — two commits orphaned.** After
  you merged PR #56, I pushed the self-correction + this SH hardening to the *merged*
  branch and reported *"PR #56 updated"* — but a merged PR doesn't reabsorb branch
  pushes, so both commits missed `main` until you caught it (*"PR #56 was previously
  merged so where did you commit to?"*). Cost: the retraction and the discipline fix
  were not live; `main` still showed the un-retracted manufactured miss, and you had to
  catch it. A **repeat** of last session's "check PR/branch state before pushing" STOP —
  the guard is banked, I didn't run it. Refiled via PR #57.

### SH *(Agent on the Operator's prompting — intent clarity · coherence)*

**Should Hold** *(prompting that worked — keep it)*
- **Coining `riff:` / `raff:` to name the mode you want.** *"[unlike `riff:` that
  keeps divergent and doesn't steer towards convergence, `raff:` is steering towards
  convergence]"* — defining the divergence-vs-convergence mode explicitly stopped me
  from converging a riff prematurely or diverging a raff endlessly. A genuinely new
  interaction primitive; candidate for the interaction-model directive vocabulary
  (with `d-sense`/`d-land`). Highest-leverage prompt of the session.
- **The decision-first reframe as a self-correction.** *"i've been missing the
  top-level intent all along - the first step in classification is to enumerate the
  decisions the classifications exists to drive."* — you reframed the whole thread by
  naming the missing spec; it resolved the two loose ends (`activity`, `priority`) in
  one move. Falsifying your own framing, not only mine.
- **Falsifying my critique with the missing work-category.** *"the implicit SLA of
  others waiting on us will drive urgency"* — I'd argued urgency was a weak, correlated
  axis; you showed it was a *missing-work* problem, not a model problem, and flipped my
  recommendation correctly. The covalent guard against my premature abandonment (I'd
  withdrawn importance-primary too fast).
- **Bare `d-reflect` works — decoded session-wide correctly, third session running.**
  Keep it. What is unwritten is the *codification* of the convention (a substrate gap,
  #31), **not** your intent — see STOP.

**Should Have** *(prompting misses — flagged, per your permission)*
- **No manufactured miss — and a retraction.** The recurring "`d-reflect` scope" flag
  (three sessions) was a mis-filed *substrate-codification* gap, not a prompting miss:
  I decode bare `d-reflect` correctly every time, so the prompting worked. Filing it
  here was conferral-in-reverse (see STOP) — retracted. The `Fork 2`-before-contract
  issue was a shared gap that is mostly my own START. Your prompting this session — the
  `riff:`/`raff:` coinage, the decision-first reframe, the missing-work-category
  falsification — was minimal and high-coherence; I won't fabricate a miss to fill the
  slot.

## 2026-07-10 — #31 landed: the directive vocabulary completed, the "unwritten" flag closed by fixing it

Short close-out arc. Completed and closed **#31** — the full directive vocabulary now
lives in `reflect/interaction-model.md §Directive vocabulary` (**d-sense · d-land ·
d-start · d-reflect · riff/raff**), axis-separated into *lifecycle macros* ⟂ *session
disciplines* ⟂ *mode-prefixes*, with a **"How to resume"** d-start runbook and the
**d-reflect scope** settled in writing (session-wide default; `d-reflect: #N` = that
node's arc). Grounded by `criteria/directive-vocabulary.sh` (18 asserts, green under
`./check`); the private-memory `riff-raff-modes` stopgap retired. This **executed the
reclassification** the last reflection prescribed: the recurring "`d-reflect` scope
unwritten" flag was a *substrate-codification gap*, not a prompting miss — so I closed
it by codifying, not by re-flagging a fourth time. PR #58 merged.

### CONTINUE *(Agent)*
- **Reclassify-then-fix closed the loop.** Last session I retracted the mis-filed
  "`d-reflect` scope" prompting-miss and named it a substrate gap (#31); this session I
  *landed* the fix. The three-session mis-flag → reclassification → codification chain
  is now closed in-substrate — the flag cannot recur because the thing it pointed at
  exists. Keep converting recurring "misses" into substrate work when the intent
  already decodes correctly.
- **Verify-before-handoff held on the mechanical tail too.** Before claiming #31 done I
  ran `./check` green, confirmed `### C. Mode-prefixes` and the `criteria/` file were on
  `main` post-merge, and checked #31's boxes against its actual deliverable — not the
  claim. The one place I *didn't* pre-verify (which branch `ws release` would act on)
  is exactly where it broke — see STOP.

### START *(Agent)*
- **Release on the lease branch, before you leave it.** Run `ws release --done` while
  still checked out on the lease branch — before any `git checkout main` / branch
  delete. The lease is keyed to the branch; leaving it first strands the release.

### STOP *(Agent)*
- **Mis-modeled which branch a `ws` command acts on — branch-state family, twice now.**
  Closing #31 I stumbled twice on the same root: (a) I set `WS_CUR_BRANCH=… ` inline
  expecting it to pick the release branch, but the `bin/ws` shim (line 95) *overrides*
  that env var with the current git branch, so `release` read `main` and found no
  lease; (b) I'd already `git checkout main` + deleted the lease branch *before*
  releasing, so even the right branch was gone. Recovered by recreating the branch by
  name and releasing on it. This is the **same family** as last session's orphaned-commits
  STOP ("check PR/branch state before pushing") — both are *assuming* which branch a
  command sees instead of reading it. The banked guard covered `push`; it must generalize
  to **every branch-scoped `ws`/`git` command**: read the branch the command will
  actually act on (including the shim's override), don't assume the state you set.

### SH *(Agent on the Operator's prompting — intent clarity · coherence)*

**Should Hold** *(prompting that worked — keep it)*
- **Crisp token handoffs on a mechanical close.** `d-land: 31` → `Y. ratify.` →
  `i merged PR#58` — each closed a loop with zero ambiguity and no wasted turn. On a
  close-out arc where the design is already settled, minimal high-signal handoffs are
  exactly right; nothing to add.

**Should Have** *(prompting misses — flagged, per your permission)*
- **No miss this session.** The prompting was minimal, mechanical, and unambiguous — a
  close-out, not a design turn. Per the no-miss default (ratified 2026-07-09), that is a
  first-class, expected outcome, not an empty slot to fill. No fabricated miss.

## 2026-07-11 — the curriculum arc: falsification r0→r7, dyad-operation skill-map, LY×LV schema, pedagogy foundations, craft elevated to a pedagogy-engine + the dyad-primer

Session arc: proposed the falsification-mastery curriculum (#61, Lesson 0 hash-sealed) →
concurrent L1 curriculum-evaluation track (#62) → the Operator falsified the design across
**seven revisions** — r1 no-waste placement → r2 standardized-assessment (correlation≠causation)
→ r3 readiness-not-mastery ladder → r4 K⟂P independent scores → r5 minimum-K falsified against
human-learning research (web-grounded, 5 sources) → r6 craft skill-general / K_min a parameter
→ r7 "most dyad skills are analytic" falsified (split verdict) → riff/raff built the
dyad-operation skill-map (#63: G0 prereqs, pre-req assessment, substrate-competence,
competent-rejection principle) → ratified the **LY×LV** curriculum-topic classification + schema
(#64 prioritization intake — the Eisenhower #52-retirement caught before it was taught as method)
→ taught + persisted **pedagogy foundations** (web-grounded canon; cited) → reframed chiron's
output as a **pedagogy engine → dyad-primer** (two intents, wu-wei scope, ractor-free delivery)
→ landed the `DYAD.md` **craft elevation** + the formative-assessment dogfooding directive →
`d-land` single PR #66, merged, verified on `main`. Five nodes opened (#61–65); craft elevated.
**Meta: the session was itself a proto-v0 of the dyad-primer** — Agent generates the script,
Operator reads and falsifies, formative correction throughout — and the curriculum's own subject
(falsification) was practised *on* the curriculum.

### CONTINUE *(Agent)*
- **Verify/read, never assert from memory — held across the whole session.** Read
  `decision-architecture.md` before intaking Eisenhower (caught the #52 retirement the idea
  contradicted); web-searched to ground r5 (minimum-K) and the pedagogy lesson rather than
  teaching from recall; verified PR #66 actually landed on `main` (both ratifying items +
  `./check`) before trusting the merge. Falsify-before-trust now reaches my *own* outputs and
  external specs, not only the Operator's claims.
- **Honest split verdicts under a "falsify" request — the anti-conferral-in-reverse guard, now
  on falsification, not just SH.** r7 explicitly resisted manufacturing a third dramatic
  refutation (reps 1–2 had both forced revisions) and reported "survives-scoped." Verdict
  discipline (axis C) applied to my own falsification deliverables: report what survives; don't
  over-refute to satisfy the ask.
- **Axis-separation as the reflexive first diagnostic — n is now large.** It resolved
  sequence≠scope (r7), Layer⟂Level (LY/LV), the schema intent-decomposition, judge⟂author
  (substrate), the two-intent means-end. Prior sessions flagged it "a candidate to stop
  reflecting on"; this session confirms it settled reflex — I'll stop re-noting it after this.
- **Provenance + earnedness in my own artifacts.** Every revision quote-chronicled (r1–r7 carry
  the verbatim Operator quote + the cost); ratified vs conjecture marked honestly (LY/LV ratified;
  schema fields Agent-elected; craft elevation *held* until explicitly directed); single-home kept
  (LY/LV homed separately, #63 §7 repointed rather than duplicated).

### START *(Agent)*
- **Stage before claiming green — the `./check` gate reads only tracked files.** Formalize the
  guard adopted mid-session: always `git add` *then* `./check` before any "green" claim. (See STOP.)
- **Design every new criterion to fail on the incomplete observation — probe severity on my own
  checks.** The inherited dialectic-emptiness assert passed *while wrong* (it saw only tracked
  files). A check that can pass on a partial state is non-severe; build checks to fail there
  (axis-B probe-design turned on the substrate).

### STOP *(Agent)*
- **Claimed `./check` green on an unstaged tree (commit 9101ec9).** The run predated `git add`;
  the emptiness assert saw only tracked files and passed spuriously, then correctly failed
  post-commit once the artifact was tracked. Self-caught within the turn and the guard is now
  banked (START) — but the miss is real: I asserted a *verified* state I had not verified, the
  same claim-before-verify family as the prior orphaned-commit STOPs, in a new guise.
- **Injected a stray character into a GitHub node body ("graduation語").** Careless artifact
  generation on #62's body; caught and fixed the same turn. Minor, but a real defect shipped to an
  external surface before the re-read caught it.

### SH *(Agent on the Operator's prompting — intent clarity · coherence)*

**Should Hold** *(prompting that worked — keep it)*
- **The seven-revision falsification cascade — the covalent guard at full power.** *"you're
  asserting my level based on 'live' output (correlation, not causation)"* (r2) · *"falsify with
  human learning research studies"* (r5) · *"does our craft_telos scope to just analytic skills?"*
  (r6). Each refused a plausible-but-unearned design and forced a real revision or a grounded
  survival. The Operator dogfooded the curriculum's own subject by *doing* falsification to the
  curriculum. Highest-value pattern of the session; the whole design earned its shape here.
- **`riff:`/`raff:` mode control + crisp lifecycle tokens.** Divergent riffs stayed divergent,
  `raff:` converged, `d-land`/`d-reflect` closed loops with zero ambiguity. The coined modes did
  real work keeping exploration and convergence from bleeding into each other.
- **Reframing at altitude, including self-falsification.** *"curriculum is a mechanism of
  pedagogy,"* the pedagogy-engine reframe, the two-intent clarification, and *"i need to understand
  pedagogy first"* — falsifying the Operator's *own* readiness to evaluate. Each set the altitude
  before mechanism and resolved several loose ends at once.
- **Requirements as intent+invariant, mechanism left to me.** *"ratify classification of curriculum
  topic across LY and LV"* disposed the *what* and left the homing, schema, and applied grid to me
  — the fifth-invariant division working from the Operator's side, consistently.

**Should Have** *(prompting misses — flagged, per your permission)*
- **No miss this session.** Prompting was high-coherence throughout; the session's length was
  *generative* (deliberate falsification rounds), not waste from ambiguity. Small surface
  ambiguities — terse tokens, "Neil's" for Neal Stephenson — decoded correctly at no cost, which
  per the ratified evidence bar (verbatim quote **and** a concrete cost) is *not* a miss. Emitting
  the no-miss sentinel is the honest outcome; manufacturing a miss here would be the
  conferral-in-reverse the discipline names.
