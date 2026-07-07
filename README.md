# dyad-chiron

Home repo of **dyad-chiron** — a dyad of The Dyad Practice whose craft is
*developing practice-curriculum that carries a learner-dyad from novice to
self-sustaining mastery*. The anchor is [`DYAD.md`](DYAD.md) (loaded at session
start via the [`CLAUDE.md`](CLAUDE.md) platform shim); the parent form lives at
[The-Dyad-Practice-Commons/the-dyad-practice](https://github.com/The-Dyad-Practice-Commons/the-dyad-practice).

This README is the single home for **repo structure, with provenance** — per
the operating-policy invariant (DYAD.md #5): every decision/action is grounded
in what was decided, who elected it, when, and from what source. Provenance
sources used below: **Operator-directed** (explicit instruction),
**Agent-elected** (agent's falsifiable default, ratified by Operator merge),
**inherited** (lineage: the Commons form, or peer dyads dyad-aule ← dyad-cairn).

## Structure

- **`CLAUDE.md`** — platform shim: points a Claude-substrate agent at
  `DYAD.md`. *Provenance: inherited — the form's per-substrate anchor pattern
  (`commons/AGENT.md`, Reflect phase).*
- **`DYAD.md`** — the anchor: identity, craft, telos, value, invariant,
  DIP-dimension stubs. Named `DYAD.md` (not `AGENT.md`) to avoid conflation
  with the Commons DIP at `commons/AGENT.md`. *Provenance: DIP session,
  2026-07-07; naming rationale recorded in its own header.*
- **`README.md`** — this file: structure + provenance conventions.
  *Provenance: Operator-directed, 2026-07-07 ("capture repo structure in the
  root level README.md").* Coverage is enforced by
  `criteria/readme-structure.sh` — every top-level tracked artifact must be
  documented here, or `./check` fails.
- **`commons/`** — git submodule of the parent form (DIP, directory,
  falsification contracts, library). A fact lives in exactly one place; the
  form's facts live there. *Provenance: inherited — Commons membership.*
- **`.gitmodules`** — submodule wiring for `commons/`. *Provenance: mechanical
  consequence of the above.*
- **`reflect/`** — codified process-lessons (Reflect's settled output). Not
  curriculum — the word "lesson" is reserved for curriculum vocabulary.
  *Provenance: ontology #7, DYAD.md.*
- **`bin/`** — the Dyad Runtime (**dyad-rt**): the foundational
  service/capability layer abstracting fine-grain permission control and
  underlying system services. *Provenance: Operator-directed bootstrap
  (2026-07-07, "copy dyad-aule's bin/claude … set the foundational
  service/capability layer"); implementation ported dyad-aule ← dyad-cairn,
  re-homed to chiron's boundary (DYAD.md #5).*
  - `bin/claude` — launcher: per-launch, Operator-opt-in DYAD mode (native
    permission gate OFF; dyad-rt is the authority). Extensionless and
    path-invoked by design — `bin/` is deliberately not on PATH.
  - `bin/_dyad-rt` — the enforcer: single home of the boundary policy (never
    mutate `main`; `gh pr merge` is the Operator's). The `_` prefix marks
    "internal, not a user entry point" (inherited convention; also functional —
    `check` skips `_`-prefixed criteria helpers).
  - `bin/git` · `bin/gh` — physical wrappers routing mutations through the
    enforcer (Execution Sandbox Invariant): the friendly early steering vector.
  - `bin/ws` — workstream tool: renders the DAG from GitHub Issues, and is
    the **lifecycle single-home** (node #16: clarify → dispose → execute →
    blocked, + done = closed; statuses = Activity Board lanes 1:1) — the
    lint-gated `converge` assertion, `dland` disposition recording, and the
    node **lease protocol** (`claim`/`release`, with `lock:<branch>` labels as
    the board-visible holder cache) enforcing the concurrent-thread-execution
    invariant (DYAD.md #5) — a leased node is not claimable by another thread.
- **`.githooks/`** — `pre-commit` + `pre-push`: the hard floor, firing even on
  raw `git` (the launcher wires `core.hooksPath` here). Survives gate-off;
  `--no-verify` is the one visible escape. *Provenance: ported from dyad-aule,
  same directive as `bin/`.*
- **`.github/workflows/`** — repo automation: `node-lint.yml`, the readiness
  flip-gate — a node labeled `status:dispose` that fails the WS-NL readiness
  contract (or whose convergence went stale) is self-healed back to
  `status:clarify` with a comment naming the misses. Policy single-homed in
  `bin/ws gate`; the workflow is trigger + transport. *Provenance: WS-NL node
  #14, Operator-proposed and d-sense ratified 2026-07-07; lanes per the
  lifecycle ratified on node #16, same day.*
- **`check`** + **`criteria/`** — the acceptance-criteria runner: each
  capability deposits executable criteria; `./check` grounds them all.
  Earnedness (chiron's craft value) made computational — a claim without a
  passing check is conferred, not earned. *Provenance: aule's `criteria/`
  pattern, pre-committed to by DYAD.md ("cheap enforcing checks … per aule's
  `criteria/` pattern").*

- **`dialectic/`** — live contests: open questions under stress-test; a record
  moves to `reflect/` when the question earns its answer. First artifact:
  `interaction-model.md` (PROPOSED). *Provenance: ontology #7, DYAD.md; dir
  created on first artifact, as the ontology prescribes.*
- **workstream nodes — [GitHub Issues](https://github.com/pltrinh1122/dyad-chiron/issues)**
  — single home for cross-session work state: one issue per workstream
  (intent, acceptance criteria, `Depends-on:` edges, status, provenance).
  `bin/ws` renders the DAG + pointer view on the fly; no committed
  `WORKSTREAMS.md` exists to drift. *Provenance: Operator-directed
  (2026-07-07, two falsification rounds — "minimum … pointers to actual node
  details … leverage existing cloud durable infrastructure like GitHub
  Issues" / "generated on the fly"); see `dialectic/interaction-model.md`
  fork 3.*

Future artifact-kinds per ontology #7 (created on first artifact, not before):
the **curriculum home** (planned as a separate, substrate-agnostic repo —
Agent-elected default pending Operator ratification).

## Naming decisions (worked examples of the provenance invariant)

- **Branch `substrate/dyad-rt`** — "substrate" is the Operator's own vocabulary
  ("the foundational service/capability layer of our dyad-substrate",
  bootstrap directive 2026-07-07); the `<layer>/<component>` pattern is
  Agent-elected, echoing aule's `craft/<name>` branch shape. Falsifiable: if
  the Operator prefers another taxonomy, renaming a branch is cheap.
- **Kept aule's names** (`bin/_dyad-rt`, `.githooks/`, `check`, `criteria/`)
  rather than inventing chiron-flavored ones — Agent-elected: minimal
  divergence from lineage keeps cross-dyad reading cheap and honors
  don't-over-build. Divergence happens where the *boundary* differs, not the
  *shape*.
- **`dyad-rt`** — the Operator's own name for the runtime (bootstrap
  directive); retained verbatim.

## Conventions

- **Provenance invariant** (single home: DYAD.md operating-policy #5): every
  decision/action is grounded — what, who elected it, when, from what source.
  Carried in artifact headers (the WHY blocks), commit messages, and this
  README for structure.
- **Branches:** work on `<layer>/<component>`; `main` is the Operator's —
  merge-to-main is an identity act (enforced by dyad-rt, proven by `./check`).
- **Trust:** run `./check` before trusting any capability claim.
