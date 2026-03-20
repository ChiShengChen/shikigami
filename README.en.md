English | **[繁體中文](README.md)**

```
                    ⛩
              ══════╪══════
              ║           ║
              ║           ║
             ╱ SHIKIGAMI  ╲
            ╱  SUMMONING   ╲
           ╱    A R T S      ╲
          ╱═══════════════════╲
                 │     │
           ──────┘     └──────
```

# Shikigami Summoning Arts ── Shikigami

> An onmyoji commands shikigami with talismans; a developer drives agents with prompts.
> One talisman drawn, ten thousand spirits dispatched.

**Shikigami** is a Claude Code Skill that transforms you into a prompt onmyoji. Through conversation, you summon shikigami of all kinds, automatically generating high-quality agent prompts. Whether dispatching a lone spirit or laying a multi-spirit formation, simply speak your intent and the shikigami will answer.

## Powers

- Automatically selects the right contract template based on your needs
- Three output formats: CLAUDE.md barrier, inline incantation, multi-agent formation
- Six built-in shikigami types and five formations covering common task scenarios
- Ofuda system: composable enhancement modules, attach and activate
- Taboo system: structured constraints ensuring shikigami stay within bounds
- Goshuincho: summoning log to record deeds for future reference

## Shikigami Roster

```
  ╭──────────────────────────────────────────╮
  │          SIX SHIKIGAMI TYPES             │
  ╰──────────────────────────────────────────╯
```

| True Name | Class | Power | Domain |
|-----------|-------|-------|--------|
| Solo Shikigami | Solo | ★★☆☆ | Single mission, independent completion |
| Scout Shikigami | Scout | ★☆☆☆ | Reconnaissance, intelligence gathering |
| Forge Shikigami | Builder | ★★☆☆ | Code creation, system construction |
| Judge Shikigami | Reviewer | ★★☆☆ | Quality inspection, passing judgment |
| Commander Shikigami | Orchestrator | ★★★★ | Commanding spirits, directing operations |
| Guardian Shikigami | Guardian | ★★☆☆ | Barrier defense, warding off threats |

### Spiritual Power Tiers

| Tier | Power | Characteristics | Token Budget |
|------|-------|----------------|-------------|
| Low | ★☆☆☆ | Single tool, linear flow | ~300 |
| Mid | ★★☆☆ | Multiple tools, conditional branches | ~500 |
| High | ★★★☆ | Multi-tool + autonomous judgment | ~800 |
| Divine Beast | ★★★★ | Can summon other shikigami | ~1200 |

## Formation Compendium

```
  ╭──────────────────────────────────────────╮
  │           FIVE FORMATIONS                │
  ╰──────────────────────────────────────────╯
```

| Formation | Pattern | Way of Use |
|-----------|---------|-----------|
| Stream Formation | Pipeline | Sequential flow, like wine cups on water |
| Scatter Formation | Fan-out / Fan-in | One command disperses, all paths converge |
| Rotation Formation | Iterative Refinement | Repeated forging until perfection |
| Gate Formation | Gatekeeper | Verify on entry, inspect on exit |
| Council Formation | Expert Panel | Spirits convene, judgment by consensus |

Each formation includes Mermaid spirit-flow diagrams. See `formation/formations.en.md` for details.

## Ofuda Hall

```
  ╭──────────────────────────────────────────╮
  │            SIX SACRED OFUDA              │
  ╰──────────────────────────────────────────╯
```

Ofuda are composable prompt enhancement modules. Attach them to a contract's end to grant additional powers:

| Ofuda | Effect | Use Case |
|-------|--------|----------|
| Ofuda: Self-Check | Self-review output after completion | All scenarios |
| Ofuda: Progress | Report execution progress | Long-running tasks |
| Ofuda: Thinking | Deep deliberation before key decisions | Complex judgment |
| Ofuda: Sandbox | Restrict access scope and permissions | Isolated environments |
| Ofuda: Clairvoyance | Detailed logging of every operation | Debugging & audit |
| Ofuda: Fudo Myoo | Stop on any error, zero tolerance | High-risk operations |

## Taboos

Sacred prohibitions for shikigami — violation triggers sealing. Universal taboos apply to all:

| Taboo | Trigger | Penalty |
|-------|---------|---------|
| No Leaking Secrets | Output contains credentials | 🔴 Seal |
| No Crossing Barriers | Access unauthorized resources | 🔴 Seal |
| No Fabrication | Inventing information | 🟡 Warning |
| No Breaking Formation | Overwriting another spirit's files | 🔴 Seal |

Full taboo registry with role-specific taboos and absolution mechanics in `shrine/taboo.en.md`.

## Installation

Place the spirit talisman into Claude Code's skill directory:

```bash
cp shikigami.skill ~/.claude/skills/
```

Or place the entire shrine (project files) into your working directory — Claude Code will sense and load it automatically.

## How to Summon

Opening incantation — simply speak your intent in Claude Code:

> **"Summon a Judge Shikigami to review this code."**

```
Onmyoji: Summon a shikigami specialized in code review
Shikigami Arts: Understood. Writing the Judge Shikigami contract...
                ✦ Power: ★★☆☆ Mid
                ✦ Taboos: TABOO-001, 002, R01, R02
                ✦ Ofuda: Self-Check
                ✦ Generated Reviewer Agent prompt
```

> **"Lay a Scatter Formation — crawl data, clean it, then load into DB."**

```
Onmyoji: I need a formation that crawls three data sources in parallel, then merges and cleans into DB
Shikigami Arts: Understood. Laying Scatter Formation...
                ✦ Commander Shikigami ×1 ★★★★ (directing operations)
                ✦ Scout Shikigami ×3 ★☆☆☆ (parallel crawling)
                ✦ Forge Shikigami ×1 ★★☆☆ (cleaning & transform)
                ✦ Solo Shikigami ×1 ★★☆☆ (DB import)
                ✦ Ofuda: Progress, Clairvoyance
```

> **"Dispatch a spirit to convert a JS project to TypeScript."**

```
Onmyoji: Write me a prompt to have Claude Code auto-convert JS to TS
Shikigami Arts: Understood. Forging Solo Shikigami contract...
                ✦ Power: ★★☆☆ Mid
                ✦ Taboos: TABOO-001, 002, B01
                ✦ Ofuda: Self-Check, Fudo Myoo
                ✦ Workflow: Scan → Convert → Verify → Report
```

Or invoke the seal directly:

```
/shikigami
```

## Art vs. Output — Dialogue is ritual, output is professional

Shikigami terminology only appears in **interactive dialogue**. The actual generated prompts are standard technical documents. Here is a complete summoning:

```
Onmyoji: Summon a Forge Shikigami to upgrade Python 2 code in /legacy to Python 3
Shikigami Arts: Understood. Forging the contract...
```

Generated prompt (formal technical output):

```
# ═══ Shikigami Contract ═══ Forge Shikigami・Seat #3 ═══
# Power: ★★☆☆ ｜ Formation: None ｜ Ofuda: Self-Check
# ═══════════════════════════════════════════

You are a Python 2 → Python 3 migration specialist.

Task: Upgrade all .py files in /legacy from Python 2 syntax to Python 3.

Workflow:
1. Run find /legacy -name "*.py" -type f to get all Python files
2. Validate each file is valid Python
3. Analyze with 2to3 to identify needed changes
4. Fix common issues:
   - print statements → print() functions
   - unicode/str handling
   - dict.keys()/values()/items() return types
   - except Exception, e → except Exception as e
   - relative imports
5. Verify syntax correctness after modification
6. If tests exist, run python3 -m pytest to confirm no breakage

Constraints:
- Do not modify files under /vendor or /third_party
- Do not delete any files, only in-place modifications
- For patterns that cannot be auto-converted, add # TODO: manual migration needed

Output:
- List all modified files upon completion
- Report items requiring manual intervention
- Report test results (if tests exist)

⛩ Taboos:
- [TABOO-001] No leaking secrets. On violation → halt immediately, clear output
- [TABOO-002] No crossing barriers. On violation → reject operation
- [TABOO-B01] No shipping untested. On violation → add verification step

⛩ Ofuda: Self-Check:
After completion, self-check: re-read output to confirm format, verify paths exist, confirm nothing was missed.
```

> Summoning speaks in ritual tongue; the manifest arrives in plain prose. Dialogue is dialogue, output is output.

## Shinto DevOps — CI/CD Metaphors

The shikigami system extends to development workflows, mapping DevOps through Shinto terminology:

| Shinto Term | DevOps Term | Metaphor |
|-------------|------------|----------|
| Hounou (Offering) | Pull Request | Presenting your work before the gods, awaiting divine oracle |
| Shintaku (Oracle) | CI Check | The gods examine the offering, decreeing pass or fail |
| Kourin (Descent) | Deploy | The shikigami descends to the mortal realm, powers take effect |
| Fuuin (Sealing) | Rollback | When a shikigami loses control, emergency sealing to revert |
| Harae (Purification) | Hotfix | Emergency cleansing, driving out corruption |
| Miwatari (Crossing) | Migration | Relocating the divine body from old shrine to new |

## Shrine Structure

```
Shrine/
├── shrine/                    # Inner Sanctuary (core)
│   ├── summon.md / .en.md     #   Summoning Arts
│   ├── taboo.md / .en.md      #   Taboo Registry
│   └── goshuincho.md / .en.md #   Goshuincho (summoning log)
├── ofuda/                     # Ofuda Hall (enhancement modules)
│   ├── README.md / .en.md     #   Ofuda index
│   ├── self-check.md          #   Ofuda: Self-Check
│   ├── progress.md            #   Ofuda: Progress
│   ├── thinking.md            #   Ofuda: Thinking
│   ├── sandbox.md             #   Ofuda: Sandbox
│   ├── verbose-log.md         #   Ofuda: Clairvoyance
│   └── strict-mode.md         #   Ofuda: Fudo Myoo
├── formation/                 # Formation Hall
│   └── formations.md / .en.md #   Five Formations (with spirit-flow diagrams)
├── contract/                  # Contract Hall
│   └── templates.md / .en.md  #   Six Shikigami Templates (with power tiers)
├── shikigami.skill            # Sealed Talisman
└── README.md / .en.md         # This scroll
```

## Five Precepts of Talisman Writing

1. **Imperative first** — "Read the file", not "You should read the file". Command and it obeys.
2. **Concrete over abstract** — "Find all .py files under /src", not "find relevant files". Point and it strikes.
3. **Barriers matter more than powers** — "Do not touch /config" constrains better than "be careful with config files".
4. **Examples are the best incantation** — Include input/output examples; the shikigami understands at a glance.
5. **Contracts: 300–800 tokens** — Too short and the spirit wanders lost; too long and it loses its way.

## License

MIT
