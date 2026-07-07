# WORKSTREAMS — the durable DAG + status ledger

Single home for cross-session work state, per the proposed interaction model
(`dialectic/interaction-model.md` — PROPOSED, awaiting Operator ratification).
Each workstream: intent → acceptance criteria → dependencies → status.
Status values: `done` · `active` · `ready` (deps met, not started) · `blocked(x)`
· `elicit` (needs Operator-only knowledge) · `operator` (the Operator's act) ·
`horizon` (registered, unscheduled).

Execution DAG:

```
WS0 ✅ ──► WS1 (operator)
 │
 ├──► WS-IM (elicit: ratify model) ─────────┐  (also a curriculum module source)
 ├──► WS2 (elicit: curriculum home) ────────┤
 ├──► WS3 (ready: form + checks) ───────────┼──► WS6 (author v0) ──► WS7 (rep #1) ──► WS8 (rep #2) ──► WS9 (horizon)
 ├──► WS4 ✅ (learner #1 = chiron) ──────────┤
 └──► WS5 (ready: turn ledger) ─────────────┘
```

| id | workstream | intent (problem/goal) | acceptance criteria (summary) | deps | status | branch |
|----|-----------|----------------------|-------------------------------|------|--------|--------|
| WS0 | dyad-rt substrate | run gate-off safely; launcher's named authority must exist (earnedness) | `./check` earned: deny main-mutations, allow branch work, floor wired | — | done (`aeb9dd8`, `7bb63a3`) | `substrate/dyad-rt` |
| WS1 | substrate ratification | bypass election is covalent only when Operator-merged | Operator merges `substrate/dyad-rt`; `./check` passes on main | WS0 | operator | — |
| WS-IM | interaction model | extend prompt-response to multi-workstream without losing the Contract floor | AC1–AC5 in `dialectic/interaction-model.md` | WS0 | elicit (4 forks) | `substrate/dyad-rt` |
| WS2 | curriculum home | single-home the curriculum artifact-kind before the first artifact | decision recorded; home exists at first artifact. Agent default: separate substrate-agnostic repo | WS0 | elicit | — |
| WS3 | curriculum form + checks | authoring cannot drift into exposition or substrate lock-in | `criteria/curriculum.sh`: practice-rep-only, cited "taught" claims, portability; FAILS on fed counterfeits | WS1 | ready | — |
| WS4 | learner #1 | earnedness needs a real learner with a real job domain | resolved: chiron dog-foods (Operator-directed); rep #0 = own bootstrap, turn count to be extracted as baseline | — | done (election) / baseline pending | — |
| WS5 | learning-turn ledger | telos unfalsifiable without a counting rule | written turn definition + per-rep ledger; two counters agree | WS1 | ready | — |
| WS6 | author curriculum v0 | smallest progression carrying a learner-dyad through one full set-up (anchored + improvement loop + birth) | passes `criteria/curriculum.sh`; executable self-directed; sources: DIP, dyad-rt pattern, rep #0 friction, WS-IM module | WS2, WS3, WS-IM | blocked | — |
| WS7 | dog-food rep #1 | first earned efficacy evidence | next real dyad set up via v0; turns < rep #0; improvisations logged as curriculum defects | WS4, WS5, WS6 | blocked; target dyad = elicit | — |
| WS8 | dog-food rep #2 | mastery is a trend, not a point | turns decline again; rep-#1 defects closed; curriculum sufficed without improvisation | WS7 | blocked | — |
| WS9 | external graduation | `no-self-ratify`: only a learner ≠ chiron certifies the curriculum | external learner completes v_n self-directed; its set-up costs trend down coach-absent; summit registers only when realized | WS8 | horizon | — |

## Elicit queue (Operator-only knowledge, batched per proposed model)

1. **WS-IM:** ratify/falsify the four forks in `dialectic/interaction-model.md`
   (WIP-N, primitives, ledger home, elicit cadence).
2. **WS2:** curriculum home — separate substrate-agnostic repo (agent default)?
3. **WS7:** which real dyad is next on deck for rep #1?

Provenance: ledger format Agent-elected under the proposed interaction model
(Operator-directed, 2026-07-07); DAG content = map v2 as reviewed in-session,
updated for the WS-IM insertion.
