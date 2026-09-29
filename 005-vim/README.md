# VIM - Vi IMproved

Installs Vim.

## Usage

Run from the repository root:

```bash
bash 005-vim/install.sh
```

## Quick reference

| Task                                          | Keys / command                  |
| --------------------------------------------- | ------------------------------- |
| Delete character under cursor                 | `x`                             |
| Delete / change forward by a word             | `dw` / `cw`                     |
| Delete / change the whole word under cursor   | `diw` / `ciw`                   |
| Delete / change from cursor to end of word    | `de` / `ce`                     |
| Delete / change the whole line                | `dd` / `cc`                     |
| Select characters / lines / rectangular block | `v` / `V` / `Ctrl-v`, then move |
| Copy selection (yank) / cut selection         | `y` / `d`                       |
| Paste after / before cursor                   | `p` / `P`                       |
| Undo / redo                                   | `u` / `Ctrl-r`                  |
| Search forward / next / previous              | `/text`, `n`, `N`               |
| Find files with fzf                           | `\ff`                           |
| Search command history / buffers              | `\fo` / `\fb`                   |
| Search file contents                          | `\fg`                           |

The leader key is `\`. `\fg` runs `:Rg` and requires ripgrep (`rg`).
