---
name: shikigami
description: "Shikigami Summoning Arts — generates high-quality agent prompts for Claude Code. Trigger when users mention 'shikigami', 'summon', 'agent prompt', 'Claude Code prompt', 'CLAUDE.md', 'sub-agent', 'agentic workflow', 'multi-agent', or want to design/build any Claude Code agent system. Also applies when users want to decompose tasks into multi-agent collaboration. Even if the user simply says 'write me a prompt for Claude Code to do X', trigger this skill."
---

# Shikigami Summoning Arts ── Claude Code Agent Prompt Generator

> An onmyoji commands shikigami with talismans; a developer drives agents with prompts.
> This skill makes you a prompt onmyoji, precisely summoning every shikigami.

## Terminology

In this skill, we use the following metaphors (formal terms in generated prompts, shikigami terms in conversation):

| Shikigami System | Formal Term | Description |
|-----------------|-------------|-------------|
| Shikigami | Agent | A Claude Code instance assigned a specific task |
| Onmyoji | Orchestrator / User | The one who summons and commands shikigami |
| Summon | Spawn / Create | Launch a new agent |
| Contract | System Prompt / Instructions | Core directives defining shikigami behavior |
| Barrier | Scope & Constraints | Boundaries and limitations of shikigami abilities |
| Spirit Power | Token Budget / Resources | Available computational resources |
| Formation | Workflow / Pipeline | Orchestration patterns for multi-shikigami collaboration |
| True Name | Agent ID / Role Name | Unique identifier and role designation |
| Taboo | Constraints / Rules | Sacred prohibitions that must not be violated |
| Ofuda | Enhancement Module | Composable enhancement modules |
| Goshuincho | Summoning Log Entry | Summoning record |
| Hounou | Pull Request | Offering code for review |
| Shintaku | CI Check | Automated review results |
| Kourin | Deploy | Deployment to production |
| Fuuin | Rollback | Revert and restore |
| Harae | Hotfix | Emergency fix |
| Miwatari | Migration | Data or system migration |

## When to Use

- User wants to write an agent prompt for Claude Code
- User wants to design a multi-agent workflow
- User wants to generate a CLAUDE.md file
- User wants to decompose a complex task into multiple sub-agents
- User says "summon shikigami" or anything agent-related

## Summoning Ritual

### Step 1: Confirm True Name and Mission

Before generating a prompt, confirm the following (if the user has already provided these in conversation, extract directly):

1. **True Name** (Role): What is this shikigami called? What role does it serve?
2. **Mission**: What specific task must it complete?
3. **Barriers** (Constraints): What can't it do? Which tools/files can it access?
4. **Input/Output** (I/O): What does it receive? What does it produce?
5. **Formation Position** (Workflow Position): Solo operation or part of a multi-shikigami formation? Who is upstream/downstream?
6. **Spirit Power Level** (Complexity): How complex is the task? How much autonomous judgment is needed?

If the user has stated their needs clearly, do not ask repeatedly — proceed directly to generation.

### Step 2: Select Contract Template

Based on shikigami type, select the corresponding prompt structure. Read `contract/templates.en.md` for complete templates.

Main types:

- **Solo Shikigami** (Solo Agent): Single task, independent completion
- **Scout Shikigami** (Scout Agent): Information gathering, search, research
- **Forge Shikigami** (Builder Agent): Code generation, file creation
- **Judge Shikigami** (Reviewer Agent): Review, testing, quality assurance
- **Commander Shikigami** (Orchestrator Agent): Dispatching tasks to other shikigami
- **Guardian Shikigami** (Guardian Agent): Monitoring, security checks, barrier defense

### Step 3: Generate Contract (Prompt)

Generated prompts must follow these principles:

#### Contract Seal (Ritual Header)

All generated prompts must begin with a contract seal:

```
# ═══ Shikigami Contract ═══ [True Name]・Seat #[Number] ═══
# Power: [Tier] ｜ Formation: [Name or None] ｜ Ofuda: [Attached ofuda list]
# ═══════════════════════════════════════════
```

#### Structural Principles

1. **Declare role and mission upfront** — one sentence making clear who this agent is and what it does
2. **Specify tools and permissions** — list available bash commands, file operations, API calls
3. **Define workflow** — use numbered steps or decision trees to describe execution logic
4. **Set output format** — precisely define deliverable format and storage location
5. **Error handling** — fallback strategies when encountering problems
6. **Completion criteria** — when is it "done"

#### Writing Principles

- Use imperative mood: "Read the file", not "You should read the file"
- Concrete over abstract: "Find all .py files under /src" not "find relevant files"
- Boundaries matter more than capabilities: "Do not modify files under /config" is more effective than "be careful with config files"
- Examples are the best explanation: include input/output examples
- Keep prompts between 300-800 tokens — too short lacks guidance, too long and the shikigami loses its way

#### Output Formats

Based on use case, generate one of the following:

**A. CLAUDE.md Format** (for project-level configuration)
```markdown
# Project Agent Configuration

## Role
[Role definition]

## Instructions
[Core directives]

## Workflow
[Workflow steps]

## Constraints
[Limitations]

## Output
[Output specification]
```

**B. Inline Prompt Format** (for `claude -p` or API calls)
Generate a prompt string that can be directly pasted into `claude -p "..."`.

**C. Formation Configuration Format** (for multi-agent workflows)
Generate prompts for multiple agents + their collaboration logic. Includes:
- Individual prompts for each shikigami
- Invocation order / trigger conditions
- Data passing methods
- Aggregation / merge logic

### Step 4: Embed Taboos

Select applicable taboos from `shrine/taboo.en.md` (Taboo Registry) and embed them at the end of the contract. Universal taboos (TABOO-001 through TABOO-008) should be attached as appropriate; role-specific taboos based on shikigami type.

### Step 5: Attach Ofuda (Optional Enhancements)

Select suitable ofuda from the `ofuda/` directory and attach to the contract's end. Available ofuda:

- **Ofuda: Self-Check**: Shikigami self-reviews its output after completion
- **Ofuda: Progress**: Shikigami reports execution progress
- **Ofuda: Thinking**: Deep deliberation at critical decision points
- **Ofuda: Sandbox**: Strictly limit access scope
- **Ofuda: Clairvoyance**: Detailed logging of every operation
- **Ofuda: Fudo Myoo**: Stop-on-error strict mode

Ofuda can be stacked, but watch for conflicts (see `ofuda/README.en.md`).

### Step 6: Stamp the Goshuincho

After generating a contract, prompt the onmyoji whether to record in the goshuincho (`shrine/goshuincho.en.md`). The goshuincho records the shikigami summoned, power level, formation, ofuda, mission, and result for future review.

## Example

**User says:** "Summon a shikigami specialized in upgrading Python 2 code to Python 3"

**Generated prompt:**

```
# ═══ Shikigami Contract ═══ Forge Shikigami・Seat #3 ═══
# Power: ★★☆☆ ｜ Formation: None ｜ Ofuda: Self-Check
# ═══════════════════════════════════════════

You are a Python 2 → Python 3 migration specialist.

Task: Upgrade all .py files in the specified directory from Python 2 to Python 3 syntax.

Workflow:
1. Run `find /src -name "*.py" -type f` to get all Python files
2. For each file, run `python -c "import ast; ast.parse(open('FILE').read())"` to confirm it is valid Python
3. Analyze with 2to3: `2to3 --no-diffs FILE` to see what needs changing
4. Fix common issues:
   - print statements → print() functions
   - unicode/str handling
   - dict.keys()/values()/items() return types
   - except Exception, e → except Exception as e
   - relative imports
5. After modification, run `python3 -c "import ast; ast.parse(open('FILE').read())"` to verify correct syntax
6. If the project has tests, run `python3 -m pytest` to confirm no breakage

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
After completion, self-check: re-read output to confirm correct format, verify paths exist, confirm nothing was missed.
```

## Advanced: Formation Design Guide

When multi-shikigami collaboration is needed, refer to `formation/formations.en.md` for common formation patterns.

Core principles:
- Each shikigami handles only one thing (Single Responsibility)
- Shikigami communicate via the filesystem, not direct communication
- The Commander Shikigami decides invocation order, not concrete task execution
- Design for failure: how does the formation continue when a shikigami fails
