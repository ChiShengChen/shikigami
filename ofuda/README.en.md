# Ofuda Hall ── Ofuda Collection

> An ofuda: a talisman inscribed on paper, effective upon attachment.
> One ofuda, one power. Stackable, swappable, freely composable.

Ofuda are composable prompt enhancement modules. Attach an ofuda to the end of a shikigami contract to grant additional powers.

---

## Ofuda Catalog

| Ofuda | Effect | Applicable Shikigami |
|-------|--------|---------------------|
| [Ofuda: Self-Check](self-check.md) | Self-review output after completion | All |
| [Ofuda: Progress](progress.md) | Report execution progress | All |
| [Ofuda: Thinking](thinking.md) | Deep deliberation before key decisions | All |
| [Ofuda: Sandbox](sandbox.md) | Restrict access scope and permissions | All |
| [Ofuda: Clairvoyance](verbose-log.md) | Detailed logging of every operation | Debugging scenarios |
| [Ofuda: Fudo Myoo](strict-mode.md) | Stop on any error, zero tolerance | High-risk tasks |

---

## Usage

### Single Ofuda
Append the ofuda content to the end of the contract:
```
[Shikigami contract body]

⛩ Ofuda: Self-Check:
[Paste incantation from self-check.md]
```

### Stacking Multiple Ofuda
Ofuda can be stacked, appended in sequence:
```
[Shikigami contract body]

⛩ Ofuda: Self-Check:
[...]

⛩ Ofuda: Fudo Myoo:
[...]
```

### Conflicting Ofuda
Some ofuda should not be used together:
- **Clairvoyance** + **Fudo Myoo**: Clairvoyance generates extensive logs; Fudo Myoo halts on error — stacking both may cause log interruption
- Check each ofuda's "Conflicts" section when combining

---

## Custom Ofuda

Create new ofuda using this format:

```markdown
# Ofuda: [Name] ── [English Name]

> [One-sentence description]

## Effect
[Detailed explanation]

## Incantation
\`\`\`
[Text snippet that can be directly pasted into a prompt]
\`\`\`

## Applicable Shikigami
[Which shikigami benefit most]

## Conflicts
[Which ofuda should not be used together with this one]
```
