# Falsification-mastery curriculum — proposal (LIVE CONTEST)

> **WHY (provenance — DYAD.md #5).** Agent-elected falsifiable default,
> 2026-07-11, from the Operator directive: *"i need to continue to master the
> skill of falsification. we'll dogfood the curriculum in this session"* (chat,
> alignment channel). Sources: the anchor's craft constraints (`DYAD.md`
> §Craft), the learner's evidenced practice (`reflect/reflections.md`), the
> interaction model's `falsify` primitive (`reflect/interaction-model.md` §2).
> Homed in `dialectic/` because it is a live contest *by construction* —
> **Lesson 0 below is the Operator falsifying this document** — and per
> `no-self-ratify` the coach cannot ratify its own curriculum: it moves to the
> curriculum home (created at ratification, per ontology #7) only if it
> survives the Operator's falsification pass and is ratified by merge. The
> stream's **first committed artifact** — but not its first node: `ws:curriculum`
> already holds the blocked dyad-setup curriculum chain (#8–#11); this is a
> second, distinct curriculum (different learner-skill), Relates, not
> Depends-on. (The initial draft of this block claimed "first of the stream" —
> falsified by a board probe pre-delivery; corrected. Axis-C material, logged.)
>
> **Revision r1 (Operator requirement, 2026-07-11, same session):** *"as a
> learner, i don't want to waste time re-learning knowledge/skills that i've
> already mastered … i know i'm not a novice learner of the falsification
> skill, but i don't know where i should start on the learning path."* Stated
> as intent + invariants (the Operator's requirements form). The draft's F0
> violated the intent: a full-spectrum baseline re-demonstrates what the
> reflections ledger already evidences. r1 replaces it with **banked-evidence
> placement** (§1) + a **gap-targeted baseline** + a **self-correcting entry
> rule** (§4 F0): lived, verbatim-grounded records count as earned evidence;
> only unevidenced axes get baseline reps; misplacement costs at most one rep.
>
> **Revision r2 (Operator falsification, 2026-07-11, same session):** *"you're
> asserting my level based on 'live' output (correlation, not causation) and
> even if i ratify the correlation, both of us can be wrong about the
> correlation. the only true causation measure is standardized assessment."*
> r1's banked placement is **refuted** on the grounds the critique entails:
> live performance confounds skill with Agent scaffolding and luck; the
> evidence base is Agent-authored and hit-selected — misses neither half
> noticed are absent (no denominators); and dyad ratification cannot cure a
> shared misreading (`no-self-ratify`, generalized to the dyad's reading of
> its own record). r2: **placement is earned only by standardized
> assessment** — sealed-key, structurally graded difficulty, full
> denominators — administered **adaptively** so r1's no-waste intent survives
> through test *efficiency*, not test *exemption*. Banked evidence is demoted
> to a prior that sets entry difficulty and can never grant placement; it
> retains the power to revoke (a live counterexample reopens a module).

## 1. Learner, skill, terminal state

- **Learner:** this dyad's Operator — chiron's first curriculum, dogfooded on
  ourselves. The learner-*dyad* framing still binds: the Agent-half
  participates as **substrate** (rep material, scoring scripts), never as
  verdict-maker.
- **Skill:** falsification — *subjecting a claim (another's or your own) to
  the cheapest test that could refute it, and updating on the verdict
  honestly.*
- **Prior, not placement (r2; r1's "banked placement" refuted).** r1 read the
  reflections ledger as earned placement; the Operator refuted the inference:
  the ledger is live output — **correlation, not causation**. Performance
  there confounds skill with Agent scaffolding and luck; the record is
  Agent-authored and hit-selected (misses neither half noticed are absent —
  no denominators); and dyad ratification cannot cure a shared misreading
  (`no-self-ratify`, generalized to the dyad's reading of its own record).
  **Placement is earned only by the standardized battery (§4 F0).** The
  ledger evidence is demoted to a **prior** with exactly two powers:
  1. it sets each axis's *entry difficulty* in the adaptive battery — a wrong
     prior costs a few items, never a wrong placement. Entry priors: strong
     on C and D (enter at ceiling difficulty) · moderate, single-target on A
     · mixed on B (delegated probes dominate the record) · none on E (the
     instrument never existed);
  2. it can **revoke**: a violation on any live rep reopens a passed module —
     revocation by counterexample is causally sound; granting by correlation
     is not.
- **Terminal state (this curriculum's coach-absent test):** the dyad authors
  its own falsification reps, scores them by substrate script, and its
  **cost-per-detection** and **calibration error** keep improving with
  chiron's coach-role idle.

## 2. Skill decomposition — five axes (axis separation)

| axis | sub-skill | failure mode it guards |
|---|---|---|
| **A — target selection** | find the load-bearing claim: the one whose falsity is costliest and least tested | falsifying the periphery while the keystone goes untested |
| **B — probe design** | the cheapest observation that would come out *differently* if the claim were false (a severe test) | probes that cannot fail; ritual checks |
| **C — verdict discipline** | three honest outcomes — refuted · survived · not-testable-as-stated; survival ≠ proof | manufactured misses (conferral-in-reverse); survival-overclaim |
| **D — self-application** | falsify your own framing — the premise, not the answer | perfecting answers to an unquestioned wrong question |
| **E — economy & calibration** | when *not* to falsify; confidence that tracks outcomes | falsifying everything (turn burn) or nothing (rubber-stamp) |

The failure modes are the dyad's own, drawn from lived instances
(`reflect/reflections.md`, passim) — not textbook hazards.

## 3. Rep formats — the mechanics

Every lesson instantiates one of four formats; each has mechanical, earnable
scoring. ("Lesson" is used in its reserved sense — a unit of curriculum.)

- **R1 — sealed-key claims sheet.** The coach authors N claims about live
  repo/board state; k are false (seeded), subtly. The answer key is sealed by
  hash commitment — `sha256(key)` is published with the sheet; the key
  plaintext rides in a collapsed spoiler on the sheet's node. The learner
  probes, logs one line per claim (verdict + confidence), then opens the key.
  Scores: detection (seeds found / k) · false-refutations · probe cost
  (commands to verdict). *Named limitation:* the spoiler is honor-gated; the
  hash prevents key retrofit, not peeking. Adequate at dyad scale, named
  rather than hidden (the `bin/ws` lease-race precedent).
- **R2 — probe golf.** Given one claim, produce the **decisive** probe at
  minimum cost. Decisive = its observed output would differ were the claim
  false. Scored on decisiveness (mechanical for seeded claims: does the probe
  touch the seed's locus) and cost.
- **R3 — live-claim log.** No seeds — ecological material. During ordinary
  session work the learner logs one line per consequential Agent claim:
  `claim · verdict (trusted / probed-survived / refuted) · confidence`.
  Ground truth arrives from reality (CI, merge outcomes, later discovery).
  Scores, computed by script over the log: calibration (Brier) ·
  cost-per-detection. **This is the terminal instrument — it works
  coach-absent.**
- **R4 — framing rep.** The coach presents a defensible-looking artifact whose
  *premise* carries the seed: the answer is fine, the question is wrong.
  Detection = naming the premise flaw. Sealed-key as R1.

**Seeding honesty rule:** seeds live only in rep material, labeled as rep
material at the top. Never in durable dyad artifacts — the provenance
invariant is not suspended for pedagogy.

## 4. Learning path

Every step is a rep (the craft's fixed constraint) — no exposition lessons.
Gates are thresholds + trends, all **elected, not yet worn**: they resize on
first contact with real difficulty (the WIP-N precedent).

- **F0 — standardized adaptive placement (r2; this session).**
  **Lesson 0** keeps three roles — the ratification review (third invariant,
  zero extra learning-turns), the first E-R2 distillation (rubric v0, node
  #62), and the start of the R3 log — and, run under its **probe budget of
  5**, yields a baseline *signal*. What it no longer does is **place**: it is
  live and unstandardized, exactly the evidence class r2 rules out for
  placement.
  **Lesson 1 — the placement battery (promoted).** Per-axis sealed-key item
  ladders with **structurally defined difficulty** — probe hop-count for B ·
  budget size and stake spread for A · trap type for C · premise depth for
  D — administered **adaptively**: each axis enters at its prior's difficulty
  (§1), steps up on a pass, down on a fail, and stops when the level is
  bracketed (pass at n, fail at n+1) or the ceiling is held twice. Every item
  outcome is recorded, hits and misses — **full denominators**. A master
  exits in a handful of ceiling items; a gap costs items only where it is
  real — the r1 no-waste intent honored by *test efficiency, not test
  exemption*. Keys hash-sealed per item block before administration; scoring
  mechanical. **E is not item-placed**: its baseline is the first R3 log
  window (calibration cannot be pre-tested; the instrument must run).
  Named residual (§6): the coach authors the items — mitigated by pre-sealed
  keys, mechanical scoring, and difficulty defined structurally (hop-count,
  budget size), never by coach judgment.
- **F1 — probe design (axis B).** R2 series on live artifacts, difficulty
  rising: 1-hop (a label read, a grep) → 2-hop (journal-vs-label
  cross-checks) → semantic (does a `criteria/*.sh` actually assert what its
  header claims). Gate: 5 consecutive decisive probes within cost budget.
- **F2 — target selection (axis A).** R1 under scarcity: 10 claims, budget of
  3 probes; claims carry stakes (which, if false, corrupts the board or the
  anchor). Score: stake-weighted detection. Gate: 2 consecutive sheets at
  threshold.
- **F3 — verdict discipline (axis C).** R1 sheets engineered as integrity
  traps: zero-seed sheets (correct outcome = "no defect found" — the SH
  no-miss default, generalized) · unfalsifiable-as-stated claims (correct
  verdict = "sharpen the claim") · true claims that look false. Gate: zero
  integrity violations across 3 sheets.
- **F4 — self-application (axis D).** R4 framing reps, plus **retro-reps**:
  pick a ratified past decision of your own, construct the severest test it
  never faced, run it. Gate: premise-flaw detection at threshold on R4, and
  ≥ 1 retro-rep ending in a real revision *or* a grounded survival.
- **F5 — economy & calibration (axis E).** R3 live-claim log across ≥ 3
  sessions. Gate: calibration error within bound · cost-per-detection trending
  down · demonstrated *non*-falsification (claims correctly trusted — the
  skill includes not spending the turn).
- **Graduation — the coach-absent window.** K = 3 (default) consecutive
  sessions in which the coach-role authors nothing: pure R3 plus self-authored
  retro-reps, metrics computed by script, trends holding. Only then may this
  curriculum claim efficacy — real graduation is the sole certificate
  (`no-self-ratify`).

## 5. Assessment model

Three tiers, all earned:

1. **Per-lesson (formative):** the mechanical scores of §3.
2. **Module gates:** thresholds + trends of §4, checked by script.
3. **Terminal (summative):** the coach-absent window — the certificate is the
   metric trend, never the coach's stamp.

**Binding principles.** (a) No coach-conferred grade: every score is
learner-recomputable. (b) Keys sealed by hash *before* the rep. (c)
`no-self-ratify`: efficacy claimed only at real graduation. (d) **Telos
ledger:** learning-turns are counted per lesson; a lesson that spends turns
without moving a metric is a defect in the curriculum, not in the learner.

**Instrument roles (r2 — axis separation: internal ⟂ ecological validity).**
Standardized sealed-key batteries earn **placement and module gates**:
controlled difficulty, fixed ground truth, full denominators — the causal
instrument for *skill possession*. The live R3 log and retro-reps earn
**transfer and graduation**: does the skill hold in the wild, coach-absent.
Neither substitutes for the other; live evidence never grants a level
(correlation), only revokes one (counterexample), and standardized
assessment carries its own named threats — construct validity,
teaching-to-the-item — that only the live instrument checks.

**Metric definitions (countable):** detection rate · stake-weighted detection
· false-refutation count · probe decisiveness · probe cost ·
verdict-integrity violations (enumerated: manufactured miss ·
survival-overclaim · refuted-without-decisive-probe · key-peek) · calibration
(Brier) · cost-per-detection · learning-turns per lesson.

## 6. The dogfood role-conflation, named

Chiron is both coach and the learner-dyad's Agent-half. Axis-separated:
**coach-role outputs** = rep material, sealed keys, scoring scripts
(substrate); **agent-role outputs** = ordinary session work — which doubles as
R3's live material. The residual risk (the author of the claims grading their
detection) is mitigated by mechanical scoring, hash-sealing, and Operator
audit — and dissolves entirely for any future external learner-dyad. Marked,
not hidden.

## 7. Lesson 0 — open now

**Rep:** falsify this proposal. You select the targets, design the probes, and
log one line per claim attacked: `claim · probe · verdict · confidence`.
Every refutation forces a revision or a grounded survival in this dialectic;
the design is ratifiable only after your pass.

**Sealed:** the coach's pre-committed, ranked list of this document's five
most load-bearing claims —

```
sha256(lesson0-sealed-list) = e7068e86017366e05e934aed96ae6210886cff7a6e34be950530719d9990448a
```

Plaintext rides in a collapsed spoiler on the `ws:curriculum` node; revealed
after your verdicts. Overlap with your chosen targets scores axis A.

**Shared baseline (added same session):** the Operator surfaced a concurrent
L1 learning need — curriculum-form/content evaluation (`curriculum-evaluation.md`,
node #62). Lesson 0 therefore doubles as that track's E0 baseline: one pass,
two scorecards — a falsification baseline (axes A–E) and an evaluation-coverage
baseline (form ⟂ content ⟂ economy). Zero extra learning-turns. A conflation is
named rather than hidden: probe severity against *this* document partly depends
on curriculum-domain knowledge the Operator is only starting to train, so
axis-A overlap reads against a declared-novice prior, not expert targeting.

## 8. Forks held for the Operator (intent/invariant only)

1. **Skill scope (intent):** train the Operator-half's falsification only, or
   co-train the Agent-half's self-falsification discipline as a parallel
   track?
2. **R3 channel cost (channel discipline, DYAD.md #4):** the live-claim log
   adds a one-line-per-claim overhead to chat. Acceptable on the alignment
   channel, or should it home on the node/board (deferred Sense)?
3. **Graduation bar (intent):** K = 3 coach-absent sessions as the default
   window — confirm or resize.

Mechanisms disposed by the Agent, surfaced for visibility (fifth invariant):
homing in `dialectic/` until ratified · sealed-key = sha256 + node spoiler ·
scoring script homes with the curriculum when it earns its home · all
thresholds as elected defaults.
