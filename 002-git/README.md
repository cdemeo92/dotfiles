# 🐙 Git

Installs Git. The personal settings apply to repositories under `~/Desktop/Projects/`. If GnuPG has a secret key matching the configured email, the installer adds its fingerprint and enables signing for commits and tags.

## Usage

Run from the repository root:

```bash
bash 002-git/install.sh
```

## Useful commands

| Task                                                | Command                       |
| --------------------------------------------------- | ----------------------------- |
| Unstage a file without discarding its edits         | `git restore --staged <file>` |
| Amend the latest local commit                       | `git commit --amend`          |
| Find commits that were recently at a branch or HEAD | `git reflog`                  |
| Apply one commit onto the current branch            | `git cherry-pick <commit>`    |

## Rebase a feature branch

Start with a clean working tree:

```bash
git status
git fetch origin
git switch my-feature
git rebase origin/main
```

If Git reports conflicts, edit the marked files, stage each resolved file, and continue:

```bash
git add <resolved-file>
git rebase --continue
```

Repeat for each conflict. To cancel and restore the branch to its state before the rebase:

```bash
git rebase --abort
```

If the branch was already pushed, rebase rewrites its history. Only update your own branch with `git push --force-with-lease`; prefer merging on shared branches.

## Edit commit history

Inspect recent commits, then start an interactive rebase for the number you want to review:

```bash
git status
git log --oneline -n 5
git rebase -i HEAD~5
```

The editor shows one line per commit, oldest first. For example:

```text
pick a1b2c3d Add login form
pick d4e5f6a Fix validation
pick 9a0b1c2 Update tests
```

`pick` means keep the commit as-is. To edit the second commit's contents, change its `pick` to `edit`:

```text
pick a1b2c3d Add login form
edit d4e5f6a Fix validation
pick 9a0b1c2 Update tests
```

To remove the third commit, change its `pick` to `drop`:

```text
pick a1b2c3d Add login form
pick d4e5f6a Fix validation
drop 9a0b1c2 Update tests
```

Other actions you can use instead of `pick`:

| Action                              | Command             |
| ----------------------------------- | ------------------- |
| Change its message                  | `reword`            |
| Edit its contents                   | `edit`              |
| Combine it with the previous commit | `squash` or `fixup` |
| Remove a commit                     | `drop`              |

Save and close the editor to start; in Vim, use `:wq`. When Git stops at an `edit` commit, change the files and run:

```bash
git add <file>
git commit --amend
git rebase --continue
```

Use `git rebase --abort` to cancel. If the rewritten branch was already pushed, use `git push --force-with-lease` only when it is your own branch and nobody else is using it.
