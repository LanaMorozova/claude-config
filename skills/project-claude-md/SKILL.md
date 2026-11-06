---
name: project-claude-md
description: Write or revise the CLAUDE.md at the root of a project — the working instructions Claude reads on every request in that repository. Use when starting a new project, when an existing CLAUDE.md has drifted from the code, or when the user asks for project rules, project memory or a project brief.
---

# Project CLAUDE.md

A project CLAUDE.md answers one question: **what does someone need to know before touching this repository?** It is not a README — the README explains the product to people, this explains the working rules to Claude.

## Research first, write second

Never write from the template alone. Read the repository, then describe what is actually there:

1. `package.json` / `pyproject.toml` / `Package.swift` — stack, scripts, dependencies
2. The folder tree, two levels deep — what lives where
3. Config files — `tsconfig`, `vite.config`, `tailwind.config`, linter, formatter
4. Two or three real source files — naming, exports, typing, styling, comment density
5. `git log --oneline -20` — commit style, branch names, who works here
6. Any existing README, PRD, design docs — the product's own vocabulary

If the project has no code yet, say so plainly and mark the stack as undecided. A file that invents a stack is worse than one that admits there isn't one.

## Do not repeat the global CLAUDE.md

`~/.claude/CLAUDE.md` already holds what applies everywhere — commit conventions, the spacing and type scales, how to talk to the user. **The project file holds only what is true of this project.**

If a rule would be just as true in another repository, it belongs in the global file, not here.

## Structure

Adapt to the project; drop sections that would be empty rather than filling them with guesses.

```
# CLAUDE.md — Working instructions for [project]

Version and date. Project phase, in one line.

## Context
What this is, who it serves, what phase it is in, what ships.
Three or four sentences. Someone who has never seen the repo
should be able to act after reading only this.

## Working rules
The non-negotiables. What requires asking first. What is out of scope.

## Tech stack
What is actually installed and why. Mark undecided parts as undecided.

## Repository layout
The real tree, with one line per directory saying what belongs there.

## Domain language
The project's own words, and what they mean in the data model.
This is what stops a feature being built on the wrong noun.

## Conventions
Code, naming, validation, errors, tests, git — as observed, not as wished.

## Definition of done
What has to be true before a change is finished.

## What NOT to do — quick reference
A digest of the prohibitions stated above, grouped by area.
Each line names the section that owns it, and says the section wins
on any disagreement. A digest, never a second source of truth.

## Current state
What is settled, what is still open. Dated.
```

## What makes it correct

The file is finished when all of this is true. Each line is checkable — if one needs an opinion to answer, it is not done.

1. **The product is clear in thirty seconds.** Someone who has never seen the repository reads Context alone and can say what it is and who it serves.
2. **The main screen and three to five real components are named.** Not "a clean interface" — the actual screen and the actual components, by the names they carry in the design file.
3. **The token rule is stated.** Colours, spacing and radii come from tokens. A hex value or a typed number inside a component is a defect, not a shortcut.
4. **Plan before code, and what to check after.** It says that architecture and UI are reviewed first, and it says what the user should look at after each step.
5. **Git is covered.** Commit format, branch habit, and do not commit or push unless asked.
6. **Nothing is invented.** Every gap says `[O]` instead of a plausible guess.
7. **No secrets.** No password, key, token or real personal data, and none in an example file either.
8. **Every external fact is checkable in one command, and was checked.** Repository name and visibility, default branch, linked file names and keys, versions, the directory tree. A fact nobody verified is an assumption wearing a `[C]`.
9. **No rule contradicts another.** A sentence promising two of something above a table listing one, two sections each claiming to be the final word, a digest that no longer matches the section it summarises.

Points 8 and 9 are the ones a file fails silently. The others are visible on a first read; these two only surface when someone acts on the file and is wrong.

## Label claims

Where a project has confirmed and unconfirmed decisions, label them and keep the labels honest:

- `[C]` confirmed — decided, do not reopen without asking
- `[A]` assumption — working on this basis, may change
- `[O]` open — not decided; surface it, do not resolve it silently

Never present an assumption as confirmed. That single habit prevents most of the drift a CLAUDE.md is meant to stop.

## Revising an existing file

A CLAUDE.md rots quietly. The repository changes, a decision is reversed, a rule is added that disagrees with one three sections up — and the file keeps being read as if it were true. Revise before a milestone, after anything structural changes in the repository, and whenever Claude keeps doing the wrong thing in the same place.

Revision is research again, not rewriting from memory:

1. **Verify every external fact against reality.** Run the commands; do not trust the sentence. Repository name, visibility, remote, default branch, the real tree, the names and keys of linked design files, version numbers.
2. **Re-read every `[C]`.** A decision gets reversed far more often than its label gets updated. A confirmed claim that is no longer true is worse than an open question.
3. **Hunt for contradictions.** Compare each prose claim against the table beneath it, and each digest line against the section that owns it.
4. **Find the escape hatches.** "Wherever practical", "generally", "where possible" turn a rule into a preference. Either the rule holds or its exceptions are named.
5. **Run the file against "What makes it correct" above.**
6. **Bump the version and the date in the same change.** A file whose header and status section disagree about its own version has already lost the reader's trust.

Report as a list and change nothing until it is approved. Where the truth cannot be established, the claim becomes `[O]` — a revision never closes a gap by guessing.

## Output

1. Show the full content before writing anything to disk.
2. Ask what is missing — house rules, libraries, patterns the research could not see.
3. Save as `CLAUDE.md` in the repository root only after approval.
4. Do not commit unless asked.

## Don't

- Don't write a generic template and call it research.
- Don't restate the global CLAUDE.md.
- Don't invent requirements, conventions or a stack the repository does not show.
- Don't let the digest section drift from the sections it summarises.
- Don't let a revision invent what it could not verify — that is what `[O]` is for.
- Don't write prose where a table is clearer, or a table where one sentence is.
