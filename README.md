# claude-config

The standards I hold my own work to, written down and enforced automatically.

Spacing, type and radii run on fixed scales. Commits follow one convention, and a git
hook rejects the ones that don't. Everything here is **global** — it applies in every
project I open, without being invoked, on every machine I work from.

```
CLAUDE.md                          design scales and commit rules, read every session
skills/project-claude-md/          writes a project's own CLAUDE.md
git-hooks/commit-msg               rejects commits that break the convention
git/ignore                         global gitignore
install.sh                         puts it all in place
```

## What's inside

### CLAUDE.md

**Spacing, type and radii** — padding, margins and gaps are multiples of 4; font sizes
run 12, 14, 16 and then multiples of 4, with 12 as the floor; corner radii are multiples
of 2. A value off the scale is a defect, not a judgement call — fixed rather than
explained.

**No widows** — one word stranded on the last line of a heading, button or short
paragraph is a defect too. Fixed with `text-wrap: balance`, a non-breaking space, or by
rewriting the line. Never with a manual break in text that reflows: that solves one
width and breaks every other one.

**Commits** — Conventional Commits, with the parts that are easy to get wrong spelled
out: the description says the outcome rather than the implementation, `style:` means
code formatting and never visual design, and a body explains *why* instead of
restating the diff.

### skills/project-claude-md

A project's CLAUDE.md is not this one. This skill writes that one: it reads the
repository first — stack, tree, configs, real source files, commit history — and
describes what is actually there instead of filling in a template.

Its three rules worth stealing: **never repeat the global file** (if a rule would be
just as true in another repository, it belongs there, not in the project),
**label every claim** — confirmed, assumption, or open — so an assumption never
hardens into a fact by being written down, and **verify every external fact against
reality** rather than against the sentence already in the file.

It also revises a file that has gone stale, which is the failure mode that matters:
a CLAUDE.md rots quietly while still being read as true. The revision pass checks the
claims against the repository, re-reads every confirmed decision, hunts for rules that
contradict each other, and reports before changing anything.

### git-hooks/commit-msg

Blocks a commit whose message has no type, is missing the space after the colon, or
glues its body to the subject line. Warns, without blocking, about a subject over 72
characters, a trailing full stop, or a past-tense verb. Merge and revert commits pass
untouched.

## Install

```bash
git clone https://github.com/LanaMorozova/claude-config.git
cd claude-config && bash install.sh
```

Existing files are backed up as `*.bak` before anything is replaced.

## Licence

Copyright (c) 2026 Roksolana Morozova. Published to be read and reused freely.
