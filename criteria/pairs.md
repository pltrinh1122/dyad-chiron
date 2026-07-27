# criteria/pairs.md — the paired-verifier register (DYAD.md > Design principles)

> Every **earnable claim ↔ its verifier**. `criteria/paired-verifier.sh` enforces this
> register is **complete** (every `criteria/*.sh` is here) and **honest** (every home +
> verifier exists). Add a row whenever you land a new earnable artifact and its check.
> Verifiers bottom out in *execution* — `paired-verifier` is its own base case.
> One artifact may carry many verifiers (e.g. `bin/ws` implements several capabilities).

| claim | home | verifier |
|---|---|---|
| curriculum-generation §2b invariants on the assessment bank | dialectic/falsification-assessment-bank.md | curriculum-lint |
| K-record ledger well-formedness (gate/fluency valid) | dialectic/k-record.md | k-record |
| the claim→constraint glossary | DYAD.md | glossary |
| the Ratify→PR process principle | reflect/interaction-model.md | ratify-pr |
| the d-rub Validate discipline | reflect/interaction-model.md | d-rub-vocabulary |
| the directive vocabulary | reflect/interaction-model.md | directive-vocabulary |
| the capture directive (todo:/idea:) | reflect/interaction-model.md | capture-directive |
| the ratified interaction model | reflect/interaction-model.md | interaction-model |
| the axis-separation design principle | DYAD.md | axis-separation |
| reflections → per-session files + frozen monolith | reflect/reflections | reflections-per-session |
| README structure coverage (provenance) | README.md | readme-structure |
| the dyad runtime (enforcer + hooks + wrappers) | bin/_dyad-rt | dyad-rt |
| the minimal ws lifecycle | bin/ws | ws-lifecycle |
| node readiness lint (headless-dispatchable) | bin/ws | ws-lint |
| the earnedness close gate | bin/ws | earned-done-gate |
| liveness (a blocked node doesn't stall siblings) | bin/ws | liveness-local |
| the Activity Board render | bin/ws | activity-board |
| the Projects-v2 self-healing sync | bin/ws | activity-board-project |
| the learner-mode-invariant nav (T0–T8 ladder + concrete next) | bin/learn | learn-navigation |
| the learning-turn ledger well-formedness (two-counter agreement) | dialectic/turn-ledger.md | turn-ledger |
| the paired-verifier principle + this register | DYAD.md | paired-verifier |
