---
name: git-worktree-from-branch
description: Create a git worktree for a branch that already exists (local or remote) in the delta repo. Use when the user says "create a worktree for <branch>", "check out <branch> in a worktree", or wants to work on an existing branch without disturbing their current checkout. For starting NEW work from a Notion ticket (creating the branch too), use git-worktree-from-ticket instead.
user_invocable: true
argument: "<branch> [dir-slug]"
---

# Git Worktree from an Existing Branch

Check out a branch that already exists into its own worktree, following the layout the
other worktrees on this machine use.

## Layout

| | |
|---|---|
| Main repo | `~/delta` |
| Worktrees | `~/feature-<slug>` — one flat dir per worktree, directly in `$HOME` |

Verify with `git -C ~/delta worktree list` rather than trusting this table — a few
worktrees don't follow the pattern (`~/release-5p11` for a release branch,
`~/delta-recently-active-name`), and those names were chosen deliberately.

## Steps

1. **Resolve the branch.** Fetch first so a remote-only branch is visible:

   ```bash
   git -C ~/delta fetch origin --prune
   git -C ~/delta rev-parse --verify <branch>            # local?
   git -C ~/delta rev-parse --verify origin/<branch>     # remote?
   ```

   If only `origin/<branch>` exists, `git worktree add <dir> <branch>` still works — git
   creates a local tracking branch. If neither exists, stop and ask; do not invent a branch
   (that's `git-worktree-from-ticket`'s job).

2. **Pick the directory slug.** If the user gave one, use it. Otherwise derive 2–4 words
   from the branch name, dropping the `hafenr/` owner prefix and the `FEAT-NNNN-` ticket
   prefix — the directory describes the work, not the ticket:

   ```
   hafenr/FEAT-6705-fix-edit-participant-issues  ->  ~/feature-edit-participants
   FEAT-6708-mdcr-participant-sync-master        ->  ~/feature-participant-sync
   ```

   Show the resulting path and let the user correct it before creating anything.

3. **Check the branch isn't already checked out.** Git allows a branch in only one worktree.
   `git worktree list` shows which. If it's checked out somewhere the user isn't using it,
   switch that checkout to its usual branch first:

   ```bash
   git -C <other-worktree> status --short   # must be clean
   git -C <other-worktree> checkout <its-usual-branch>
   ```

   Never force with `--force` to get two checkouts of one branch — commits from one will
   confuse the other.

4. **Create it:**

   ```bash
   git -C ~/delta worktree add ~/feature-<slug> <branch>
   ```

5. **Verify and report** the path, branch and HEAD:

   ```bash
   git -C ~/feature-<slug> branch --show-current
   git -C ~/feature-<slug> log --oneline -1
   ```

## Gotchas

- **Do not use the `EnterWorktree` tool.** It makes its own worktree under
  `.claude/worktrees/`, which conflicts with the one created here.
- **Run later work with absolute paths into the worktree** (`git -C ~/feature-<slug> …` or
  `cd ~/feature-<slug>`), not in `~/delta`. Editing the main repo by accident is the usual
  way this goes wrong.
- `git worktree list` marks dead entries `prunable` (e.g. ones under `/private/tmp`).
  `git -C ~/delta worktree prune` clears them; it never touches live worktrees.
- Removing a worktree when done: `git -C ~/delta worktree remove ~/feature-<slug>`. Plain
  `rm -rf` leaves a stale entry that then needs a prune.
