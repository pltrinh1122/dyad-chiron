# Decision Architecture — the two classifications the dyad runs on

**Provenance:** Operator-directed, 2026-07-09 (riff→raff design arc this session).
Codifies the **decision-first** method, the **two-classification (CQRS)** split, and
the **instrument** for evaluating any classification. Extends the interaction model
(`reflect/interaction-model.md`, #3) with its decision layer. Source: this session's
dialogue. `role:model · audience:self` — `scope:commons`-candidate (portable across dyads).

---

## 0. Top-level principle — decision-first classification

A classification is a **function from `work` → the decisions it must drive.**
**Enumerate the decisions before the facets.** Decisions are the specification; facets
are the implementation. A facet with no decision behind it does not survive; "sufficient
for our needs" is undefined until *our needs* is an enumerated decision set. (The symptom
of skipping this step: facets that feel half-justified and never settle — you are
designing a data model with no queries, an API with no call-sites.)

**Method:** (1) enumerate the decisions → (2) each decision → the discriminator it needs
→ a candidate facet → (3) dedupe + orthogonalize (normalize) → (4) run the instrument (§5).

---

## 1. Two classifications, hand-in-hand — CQRS

The dyad is Operator + Agent; each half owns one decision, and the two interlock. This is
**CQRS — Command/Query Responsibility Segregation.**

| | **O — attention** (Query / **read model**) | **A — execution** (Command / **write model**) |
|---|---|---|
| decider · moment | Operator · triage-time | Chiron · execution-time |
| question | *what do I turn to, toward the telos?* | *how do I execute & allocate?* |
| lifecycle side | `clarify → dispose` (Sense + go/no-go) | `execute` |
| primary fields | `telos-lever` → **`importance`** (primary sort); **`stagnation`** = anti-starvation floor (secondary) | `reversibility` · `authority` · `context-sufficiency` · `independence` · `risk` |
| output | **importance-ranked** + disposed nodes | proceed/escalate · inline/dispatch · parallel/serial · rigor |

> **Read-model ordering (Operator-refined 2026-07-09, #52 — retires the earlier `urgency`/Eisenhower framing).**
> The read model orders by **`importance`** (telos-criticality × `telos-lever`, with the internal
> unblock-count folded in — counted once), rendered as a **single descending list, not a 2×2**.
> **`stagnation`** (`now − last-*step*` = last-meaningful-activity gap) is a **secondary, anti-starvation
> *floor*** — past a soft threshold a node is flagged `⏳ stagnant` and surfaced for a step *regardless of
> its importance rank*; it is a flag/callout, **never blended into a scalar** with importance. The retired
> `urgency`/Eisenhower 2×2 failed because its axes were not independent (a structurally-empty quadrant) and
> its blocking-count merely re-measured importance's unblock pressure (double-count). **Terminology:**
> `stagnation` (last-step inactivity, anti-starvation) is **distinct from the #16 staleness gate**
> (convergence invalidated by ground-mutation) and from total-age/"staleness" (total inactivity).

CQRS points that constrain the design:

- **Segregation is by operation (command vs query), not by person.** Both members query
  *and* command. The Operator is query-dominant but holds a **narrow, supreme command
  set** — dispositions (`d-sense`, `d-land`, elections, merge) that *authorize every Agent
  command.* Do not model the Operator as read-only; model as query-dominant with reserved
  command authority (the `authority`=Operator-reserved boundary of model A).
- **The read model is a projection of the write model — no independent authority.**
  `priority` is computed once over the ledger/DAG and materialized for the Operator's view.
  A second priority store would be a rogue write model.
- **Commands are task-based and invariant-enforcing** (`converge`, `claim`, `dland`,
  `release`) — not CRUD.

---

## 2. The interlock

- **O → A — disposition (`d-land`):** O's ranked + disposed nodes become A's *claimable
  queue.* `dispose → execute`.
- **A → O — escalation:** A hits a **one-way door** (`reversibility`=irreversible /
  `authority`=Operator-reserved / intent unclear) → back to `clarify/dispose`.
  `execute → clarify`.
- **Shared currency — `priority`:** projected once (O side), consumed by both O's view and
  A's selection. A never re-derives importance — that is what keeps the two from drifting.
- **Seam:** the lifecycle lanes *are* the boundary. O is Sense-heavy, A is Act-heavy;
  disposition and escalation are the two directions across the fold (SPAOR maps on without
  friction).

```
   shared substrate:  descriptive facets (role/audience/scope) + the Depends-on DAG
                                   │
              O ranks ─────► priority ─────► A allocates
        (what/whether)         ⇅  seam        (how/autonomy)
         clarify·dispose ◄── escalation ── execute
```

---

## 3. Shared vocabulary — the descriptive facets

`role · audience · scope` (→ derived `stream`) are **not a third classification** — they
are the common index both models read: O to weight `telos-lever`, A for portfolio balance
(WIP across streams; don't starve curriculum, cap KTLO). Landed in #43. `stream` is a
computed view, never stored.

Facet definitions (the descriptive layer): `role ∈ {model, controller}` (MVC layer
produced; `view` is generated, not worked); `audience ∈ {learner, self}` (functional,
scope-independent — the consumer's capacity); `scope ∈ {internal, commons}` (visibility /
publication — an access modifier).

---

## 4. Invariants of the architecture

1. **Freshness contract (read model).** The read model is a projection and may lag the
   write model. **Re-project before triage** when the write model moves (a dependency
   closes, a node blocks/unblocks); never triage on a stale ranking. Generalizes the
   staleness gate (#16) from *convergence* to the *priority projection*.
2. **Single priority source (DRY).** `priority` is computed once on the write model; both
   halves consume it. No read-side re-derivation.
3. **Command authority.** Every write is gated by the autonomy boundary
   (`reversibility` × `authority`); Operator dispositions authorize Agent commands
   (DYAD.md invariants 4–5).
4. **Classification ⟂ state ⟂ identity; stored ⟂ derived.** Descriptive facets are stable;
   `status` is the mutable FSM; the issue # is identity; `stream`/`priority` are derived.

---

## 5. Instrument — evaluating any classification

**Master invariant:** a classification is well-formed and sufficient iff it is the
**minimal set of orthogonal, stable dimension-facets that makes every required decision a
pure function of the facets.** Every check below is this applied at a different scope.

**Well-formedness (binary MUST-holds):**

- **dimension-named** — a noun naming the axis ("the ⟨noun⟩ of the work"); *not* an
  adjective (⇒ silent boolean), *not* a generic classifier (`type`/`kind` — placeholders
  for "a classification of").
- **single basis** — all values answer one question (one *fundamentum divisionis*).
- **MECE / total** — exactly-one over a closed set. An enum ≠ a set of mutually-exclusive
  booleans (that is `Option<Enum>`, N+1 states) — it is one-hot booleans **plus an
  exactly-one constraint.** Prefer the sum type: it makes illegal states unrepresentable.
- **right granularity** — the coarsest single-basis partition preserving every distinction
  a **consumer or standing rule** acts on (Myhill–Nerode / DFA minimization). Tests:
  *merge* if every consumer treats two values alike; *split* if a consumer sub-cases a
  value via an out-of-enum discriminator (a product hiding in the sum); *evict* a value no
  consumer/rule reads.
- **correct scale** — typed to its kind (nominal / ordinal / scalar / reference); don't
  force a reference (`depends-on:#N`, open domain) or a scalar into an enum.
- **orthogonal / normalized** — no facet derivable from another; all cross-products
  realizable (no correlated facets).
- **classification ⟂ state ⟂ identity** — never classify by mutable state.
- **1NF — no conflation** — one value per facet per node; a two-valued node is a repeating
  group → split (the #5 → #5/#44 pattern).

**Sufficiency (fitness for our needs):**

- **decision coverage** — every decision the classification must drive is a pure function
  of the facets (a decision needing out-of-schema info ⇒ missing facet).
- **parsimony** — every facet is read by ≥1 decision or standing rule (dual of coverage).
- **stability / projectibility · extensibility · decidability on contact.**

---

## 6. Already CQRS — grounding in the substrate

The design *names what the substrate was already doing* and adds §4.1 as the explicit SLA:

- **read model = generated views** (DYAD.md #4 observation channel; `bin/ws` render, the
  Observe board).
- **write model = the ledger / journal** — **label = read cache, journal = authoritative**
  (textbook read-projection vs write-store).
- **board self-heal (#25)** = projection reconciliation.
- **staleness gate (#16)** = read/write consistency detection.

---

## 7. Applied verdict on our own facets (decision-first)

Decisions the classifications drive: render stream (D1) · Operator-reserved act (D2) ·
self-ratify vs earned (D3) · telos count (D4) · attend-next (D0, the top-level intent).

- `role · audience · scope` — **confirmed**, each induced by a live decision; `scope`
  un-merged from `audience` earns its keep via D2. Open: does any consumer sub-case
  `controller`? (split test).
- `activity` — **narrowed, not evicted**: D4 (telos metric) reads `build`-vs-`operate`
  (is-rep), *not* `maintain`. The consumer sets the grain.
- `priority` (D0) — the top-level need; a **read-model projection** (model O), the first
  deliverable (#47). Its ordering is **importance-primary + `stagnation` (anti-starvation) secondary**
  (Operator-refined 2026-07-09, #52) — the `urgency`/Eisenhower framing is retired (see §1's ordering note).
