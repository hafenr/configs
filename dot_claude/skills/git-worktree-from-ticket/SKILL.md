---
name: git-worktree-from-ticket
description: Create a git worktree and branch from a Notion ticket. Use when the user wants to start working on a ticket, create a feature branch, or set up a worktree — including right after creating a ticket via create-notion-ticket ("create a worktree for that ticket"). If the FEAT-N number isn't given but appears in recent conversation, confirm it with the user before proceeding.
user_invocable: true
argument: "<ticket_number> <short_description>"
---

# Git Worktree from Ticket

Create a git worktree with a properly named branch based on a ticket number and description.

## Instructions

Given a ticket number (e.g. `FEAT-6089`) and a short description (e.g. "fix insecure cipher suites"):

1. **Determine the ticket number.**
   - If the user passed it in the argument, use that.
   - Otherwise, look in the current conversation for a recently-mentioned `FEAT-N` (e.g. one just created via the `create-notion-ticket` skill).
   - If found in conversation, **confirm with the user** before proceeding (e.g. "Use FEAT-6322 from the ticket we just created?"). Always confirm — don't assume, even if there's only one candidate.
   - If none found, ask the user for the number.
2. **Determine the description.**
   - If the user passed one, use it.
   - Otherwise derive a short one (~3-6 words) from the ticket title or conversation context, and confirm the resulting slug with the user before creating the worktree.
3. If the description seems too long (more than ~5 words), shorten it to something concise but still descriptive.
4. Slugify the description: lowercase, replace spaces with hyphens, remove special characters.
5. Construct the branch name: `hafenr/<TICKET_NUMBER>-<slugified-description>` (e.g. `hafenr/FEAT-6089-fix-insecure-cipher-suites`).
6. Construct the worktree directory name: `~/dq/dev/feature-<slugified-description>` (strip the ticket prefix like FEAT/BUG/TASK from the directory name, only use the description part).
7. **Determine the base branch.** Default to `origin/master` (fetch first to get the latest). If the user explicitly specified a different base (e.g. "off the FEAT-6280 branch", "based on hafenr/foo"), use that instead — fetch it first if it's a remote ref. Don't ask if not specified; default silently.
8. The main git repo is at `~/dq/dev/delta` (not `~/dq/dev`). Create the worktree:

```bash
cd ~/dq/dev/delta
git fetch origin <base-ref>     # e.g. origin master, or origin some-branch
git worktree add -b <branch_name> <worktree_dir> <base-ref>
```

9. Do NOT use the `EnterWorktree` tool — it creates its own separate worktree and branch (under `.claude/worktrees/`), which conflicts with the one we just created. Instead, just inform the user that the worktree is ready at the created directory path.
10. After creating the worktree, ensure all subsequent work (edits, commits, pushes) happens in the worktree directory (`~/dq/dev/feature-<slug>`), NOT in the main repo or any `.claude/worktrees/` directory. Use `cd` with absolute paths to the worktree when running commands.

## Naming Rules

- Branch: `hafenr/<TICKET>-<slug>` (e.g. `hafenr/FEAT-6089-fix-insecure-cipher-suites`)
- Directory: `~/dq/dev/feature-<slug>` (e.g. `~/dq/dev/feature-fix-insecure-cipher-suites`)
- The username prefix is always `hafenr`
- The directory prefix is always `feature-`
- Keep the slug concise: aim for 3-6 words max
