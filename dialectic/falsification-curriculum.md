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
> survives the Operator's falsification pass and is ratified by merge. First
> artifact of the `ws:curriculum` stream.

## 1. Learner, skill, terminal state

- **Learner:** this dyad's Operator — chiron's first curriculum, dogfooded on
  ourselves. The learner-*dyad* framing still binds: the Agent-half
  participates as **substrate** (rep material, scoring scripts), never as
  verdict-maker.
- **Skill:** falsification — *subjecting a claim (another's or your own) to
  the cheapest test that could refute it, and updating on the verdict
  honestly.*
- **Prior (evidence, not placement):** the reflections ledger shows strong
  artifact-level falsify-before-trust (*"i've merged. falsify."*), refusal of
  plausible-but-premature answers, self-falsified framings (the decision-first
  reframe), and counter-falsification of the Agent's critique (the
  missing-work-category flip). Less evidenced: systematic probe-severity
  design, explicit verdict/confidence logging, measured calibration,
  falsification *economy*. This prior shapes seed difficulty only — placement
  is **earned by F0**, never conferred from the coach's reading.
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

- **F0 — placement (this session).** Two reps. **Lesson 0:** falsify *this
  proposal* — live, unseeded; the ratification review the third invariant
  already requires, converted into a scored rep (zero extra learning-turns).
  The coach's ranked list of this document's five most load-bearing claims is
  hash-sealed (§7), so target-selection overlap is scorable after the pass.
  **Lesson 1:** first R1 sheet (10 claims, k ≤ 2, undisclosed), generated on
  demand this session. Output: a measured baseline per axis; modules the
  baseline proves mastered compress or skip — **earned skipping** (telos),
  never conferred.
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
