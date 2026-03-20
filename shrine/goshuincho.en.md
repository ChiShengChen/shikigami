# Goshuincho ── Summoning Log

> Every summoning leaves a vermillion seal. Deeds both great and small, recorded for posterity.

The Goshuincho records the trail of every shikigami summoning. Like the vermillion seal stamped after visiting a shrine, each entry marks the bond between onmyoji and shikigami.

---

## Goshuincho Entry Format

After each summoning, record one entry:

```
┌─────────────────────────────────────────┐
│         ⛩ GOSHUINCHO #[number]          │
├─────────────────────────────────────────┤
│  Date    │ [YYYY-MM-DD HH:MM]          │
│  Spirit  │ [True Name] ([English])      │
│  Power   │ [★☆☆☆ / ★★☆☆ / ★★★☆ / ★★★★]│
│  Formation│ [Name] or Solo Summon       │
│  Ofuda   │ [Attached ofuda] or None     │
│  Mission │ [One-line task description]  │
│  Taboos  │ [Embedded taboo codes]       │
│  Result  │ ✅ Success / ❌ Fail / ⚠️ Partial│
│  Notes   │ [Optional — special cases]   │
└─────────────────────────────────────────┘
```

### Examples

```
┌─────────────────────────────────────────┐
│         ⛩ GOSHUINCHO #001              │
├─────────────────────────────────────────┤
│  Date    │ 2026-03-19 14:30            │
│  Spirit  │ Forge Shikigami (Builder)   │
│  Power   │ ★★☆☆                        │
│  Formation│ Solo Summon                 │
│  Ofuda   │ Self-Check, Fudo Myoo       │
│  Mission │ Upgrade /legacy Python 2→3  │
│  Taboos  │ TABOO-001, 002, B01         │
│  Result  │ ✅ Success                   │
│  Notes   │ 23 files converted, 2 need manual│
└─────────────────────────────────────────┘

┌─────────────────────────────────────────┐
│         ⛩ GOSHUINCHO #002              │
├─────────────────────────────────────────┤
│  Date    │ 2026-03-19 15:45            │
│  Spirit  │ Commander (Orchestrator)    │
│  Power   │ ★★★★                        │
│  Formation│ Scatter Formation           │
│  Ofuda   │ Progress, Clairvoyance      │
│  Mission │ Parallel crawl 3 sources, merge & clean│
│  Taboos  │ TABOO-001, 002, 006, S01, S02│
│  Result  │ ⚠️ Partial                   │
│  Notes   │ Source C timed out, rest OK  │
└─────────────────────────────────────────┘
```

---

## Goshuincho Statistics

Periodically review the goshuincho to compile the following metrics and refine your arts:

### Summoning Stats
- Summoning count and success rate per shikigami type
- Most frequently used formations
- Most frequently attached ofuda

### Taboo Violation Records
- Which taboos are most frequently triggered
- Outcomes after violation
- Whether barrier settings need adjustment

### Example Stats

```
═══ Goshuincho Stats ═══ March 2026 ═══

Summon Count:
  Forge      ████████░░  12 (success rate 92%)
  Judge      ██████░░░░   8 (success rate 100%)
  Scout      █████░░░░░   7 (success rate 86%)
  Commander  ███░░░░░░░   4 (success rate 75%)
  Guardian   ██░░░░░░░░   3 (success rate 100%)
  Solo       ██░░░░░░░░   2 (success rate 100%)

Top Formations: Stream (45%) > Scatter (30%) > Rotation (25%)
Top Ofuda: Self-Check (80%) > Progress (60%) > Fudo Myoo (35%)
```

---

## Usage Recommendation

After generating a contract, prompt the onmyoji at the end of the response:

```
📝 A goshuincho entry has been prepared for this summoning. Record it?
```

The onmyoji may choose to record or skip. The value of the goshuincho lies in long-term accumulation — after a hundred summonings, the path to mastery reveals itself.
