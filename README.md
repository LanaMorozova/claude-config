# claude-config

My Claude Code setup, kept in one place so it survives a machine change and stays
the same on every computer I work from.

Everything here is **global** — it applies in every project, without being invoked.

```
CLAUDE.md                          working rules Claude reads in every session
skills/project-claude-md/          writes a project's own CLAUDE.md
git-hooks/commit-msg               rejects commits that break the convention
git/ignore                         global gitignore
install.sh                         puts it all in place
```

## Install

```bash
git clone https://github.com/LanaMorozova/claude-config.git
cd claude-config && bash install.sh
```

Existing files are backed up as `*.bak` before anything is replaced.

## What's inside

### CLAUDE.md

Two sets of rules Claude follows everywhere:

**Commits** — Conventional Commits, with the parts that are easy to get wrong spelled
out: the description says the outcome rather than the implementation, `style:` means
code formatting and never visual design, and a body explains *why* instead of
restating the diff.

**Spacing, type and radii** — padding, margins and gaps are multiples of 4; font sizes
run 12 · 14 · 16 and then multiples of 4, with 12 as the floor; corner radii are
multiples of 2. A value off the scale is a defect, not a judgement call.

### skills/project-claude-md

A project's CLAUDE.md is not this one. This skill writes that one: it reads the
repository first — stack, tree, configs, real source files, commit history — and
describes what is actually there instead of filling in a template.

Its two rules worth stealing: **never repeat the global file** (if a rule would be
just as true in another repository, it belongs there, not in the project), and
**label every claim** — confirmed, assumption, or open — so an assumption never
hardens into a fact by being written down.

### git-hooks/commit-msg

Blocks a commit whose message has no type, is missing the space after the colon, or
glues its body to the subject line. Warns, without blocking, about a subject over 72
characters, a trailing full stop, or a past-tense verb. Merge and revert commits pass
untouched.

## Licence

Copyright (c) 2026 Roksolana Morozova. Published to be read and reused freely.
