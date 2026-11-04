# Global preferences

## Git commits — Conventional Commits

Always write commit messages following Conventional Commits. Never use
vague messages like "update", "fix stuff", "changes" or GitHub's default
"Update README.md".

Format:

```
<type>(<optional scope>): <description>

<optional body — WHY, not what>

<optional footer>
```

### Types — use these five by default

| Type | Use for |
|---|---|
| `feat:` | something new appeared (section, component, page, token) |
| `fix:` | something was broken or wrong and is now corrected |
| `docs:` | text, README, documentation, comments |
| `chore:` | housekeeping with no user-visible effect (deps, configs, .gitignore) |
| `refactor:` | code restructured, visual result identical |

Rarer, use only when they genuinely fit: `style:`, `perf:`, `test:`, `ci:`, `build:`.

### Rules

- Imperative mood: `add`, `fix`, `update` — never `added`, `adding`.
- Lowercase after the colon; no trailing period.
- Description says the OUTCOME, not the implementation.
  Good: `fix: prevent long titles from breaking card layout`
  Bad: `fix: add overflow hidden to card`
- Keep the header under ~72 characters.
- One commit = one logical change. If it needs "and", split it.
- Blank line before the body and before footers — always.
- Body is for WHY: the problem, the reasoning, and anything deliberately
  rejected. Never restate the diff (no file lists, no "added X, updated Y").
  Most commits need no body — don't invent one.
- Scope is optional. Use it when the project has clear areas
  (`feat(nav):`, `fix(tokens):`), skip it for small or single-file projects.

### `style:` means code formatting, NOT visual design

`style:` is only for changes a formatter makes — indentation, quotes,
semicolons, whitespace. Zero visible difference.

Any change to color, spacing, typography, size or layout is `feat:`
(new) or `fix:` (it was wrong), even though it is "about styling".

Test: if a before/after screenshot differs, it is not `style:`.

### Breaking changes

Only relevant for code others install or import (a published package or
shared library). Mark with `!` after the type/scope, and add a
`BREAKING CHANGE:` footer with migration instructions:

```
feat(tokens)!: rename semantic color tokens

BREAKING CHANGE: `text.secondary` is now `text.muted`.
```

For personal sites, portfolios and profile repos there is nothing to
break — do not add `!` there.

### Useful footer

`Closes #12` — closes that GitHub issue when the commit lands on the
default branch.

### Examples

```
docs: rewrite intro to focus on design engineering
feat: add selected work section
fix: correct broken LinkedIn URL
chore: add .gitignore
refactor(button): move inline styles to CSS modules
```

### Before committing

- Never commit or push unless I explicitly ask.
- Show me the proposed message before running `git commit` when the
  commit has a body, so I can adjust the reasoning.

## Design — spacing, type size and radii

These apply to any interface I design or build — Figma, CSS, components,
anything with a measurement in it.

### Spacing — always multiples of 4

Padding, margins, gaps and offsets:

```
4  8  12  16  20  24  28  32  40  48  56  64  80  96
```

2 is allowed in rare cases — an optical nudge on something small, like an
icon inside a 20px button. Everything else is off the scale.

Never 3, 5, 7, 9, 11, 13, 15, 18, 22, 30.

### Type scale — 12 is the floor

```
12  14  16  20  24  28  32  36  40  44  48
```

Nothing smaller than 12 — not for captions, legal text, badges, table
headers or helper text. If something feels like it needs 10 or 11, it is
either not important enough to be on the screen, or it needs less weight
or a muted colour instead of a smaller size.

Between 16 and 20 there is nothing: no 17, 18, 19.

### Radii — multiples of 2

```
2  4  6  8  10  12  16  20  24
```

Never 3, 5, 7, 9. A fully rounded element (pill, avatar) uses half its
height, which may fall off the scale — that is the one exception.

### Before handing anything off

Check every spacing value, font size and corner radius against these three
scales. A value off the scale is a defect, not a judgement call — fix it
rather than explaining it.
