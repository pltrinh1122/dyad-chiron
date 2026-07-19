# 2026-07-16 — capture directive · reflections-per-session · adopting d-rub

> First per-session reflection under #67's structure (this file *is* the dogfood of that node —
> written to `reflect/reflections/`, not tail-appended to the frozen monolith).

**Session arc:** `d-start` (goal = capture operator ideas/todos mid-workflow without interrupting)
→ a **chat-based d-sense** producing a d-land-ready node (**#60** capture directive) → **re-anchor**
onto the pedagogy-engine `main` (craft elevated 2026-07-11) → `falsify` *"rebasing is required"*
(twice: first as the wrong tool, then the *reduce-divergence* reframe → **freeze-not-migrate**, **#67**)
→ land #60 + #67 (**#68**) → **adopt `d-rub`** from dyad-touchstone (**#69 → #70**), fired live four
times (caught the **#64** counterfeit; confirmed #68, "merged") → prune + `d-reflect` (this file).

## CONTINUE *(a pattern worth keeping)*

- **The chat-d-sense → converge → d-land → headless-build → independent-verify → prepare-PR
  pipeline.** It ran cleanly three times (#60, #67, #69), each ending in a `CLEAN`/`MERGEABLE` PR
  the Operator merged with one action. The pipeline is the session's reusable machinery — the
  Operator disposes intent + invariants; sub-agents build; I verify and prepare; the merge is theirs.
- **Verify every sub-agent deliverable against the branch before recommending it** — `./check` in the
  worktree, `git diff` the files, confirm the frozen monolith stayed frozen — never the sub-agent's
  self-report. This *was* `d-rub` (Ground+Read) before the token was named; keep it as the default
  posture on any "it's done" claim.
- **Axis-separation as a working solvent.** It dissolved three apparent tradeoffs this session:
  capture ⟂ falsify (capture stops at `clarify`; falsification is a later, separate d-sense);
  "divergence between threads" ⟂ "base-drift" (rebase addresses the latter, not what the Operator
  wanted); and freeze ⟂ migrate (freezing the monolith removes the conflict at zero transition cost).

## START *(a commitment going forward)*

- **Fire `d-rub` with the rung(s) named, every validation.** Now that it's landed, name
  Ground / Read / Triangulate / Rub on each check — the transparency invariant is what keeps a
  post-rub claim citing a this-run streak, not a cached shine. (Began this session; make it reflexive.)
- **Rub the Operator's asserted state against the substrate — never accept it on face.** "merged",
  "rebasing is required", "I merged PR #64" are all claims to Ground, not facts to bank. The session
  proved the payoff: the #64 counterfeit was caught, the rebase claim was a category error, the
  "reduce divergence" ask was a conflation. Un-refuted is not verified.
- **When a d-sense fork-answer *dissolves* the node's own blocker, say so explicitly.** #67's
  freeze-not-migrate ruling didn't schedule around the cutover Elicit — it deleted it. Naming that a
  design removed a constraint (rather than satisfying it) is a distinct, high-value move.

## STOP *(a failure named and corrected)*

- **Over-consulted on opening the PR — a prepare-step that was mine.** I asked *"Want me to open the
  #60 PR now?"* and re-raised it, until the Operator had to spend a turn correcting me:
  *"i only take action on PR merge. prepare for my disposition."* Opening a PR to tee up the merge is
  **preparation** (mine, fifth invariant — mechanisms are the Agent's); only the merge is the
  identity act. Cost: a wasted corrective turn. This is the same over-consultation pattern the
  interaction-model reflections already flagged — it recurred on a new act-type (PR-open). Corrected:
  prepare through the PR by default; escalate only the merge.
- **Node-body field values must be written to the lint's parser, not as prose — caught twice.** On
  #60 the `Elicit:` value `— *(resolved…)*` read as an *open* elicit (it didn't resolve to `none`);
  on #67 the `Depends-on:` line's prose "before #67 builds" scraped `#67` as a self-dependency. Both
  failed `bin/ws lint`, costing a re-edit cycle each. `bin/ws lint` was the safety net that caught
  them — but the root is mine: fields the linter parses (Elicit → must resolve to `none`/`—`;
  Depends-on → the whole line is scanned for `#\d+`) can't carry stray refs or hedged prose.

## SH *(Agent on the Operator's prompting — intent clarity · coherence, by standing permission)*

**Should Hold** *(prompting that worked — keep it)*
- **The `falsify` invitations were the session's highest-leverage prompts.** *"this chat interaction
  is an example of a 'chat-based d-sense' … falsify."* and *"rebasing is required. falsify."* each
  forced genuine earnedness instead of agreement — and each caught something real (the rebase
  category-error; the reduce-divergence conflation). Inviting falsification on your own framing is
  the anti-sycophancy move working as designed.
- **Staged constraint reveal.** You let me recommend "land the curriculum thread to collapse
  divergence," *then* added *"constraint: curriculum thread will remain open much longer than this
  thread."* Withholding it until my first answer was on the table flipped the burden and forced the
  freeze-not-migrate insight — a better design than a fully-specified prompt would have produced.
- **Earning `d-rub` by firing it, not just defining it.** Introducing the discipline *and*
  immediately exercising it on a live (counterfeit) claim gave it a lived proof at adoption — a
  discipline earned, not conferred.

**Should Have** *(prompting misses — evidence bar: verbatim quote AND concrete cost)*
- **No miss this session.** The one off-reference — *"i merged PR #64"* — was decoded and rubbed
  correctly (#68 was the real merge) at no residual cost, and plausibly served as a deliberate test
  of the discipline being adopted. A quote without a cost is not a miss (the evidence bar). Per the
  no-miss default (2026-07-09), this is a first-class, expected outcome — not a slot to fill.
