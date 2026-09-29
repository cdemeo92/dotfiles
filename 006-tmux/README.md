# tmux

tmux is a terminal multiplexer: it lets you manage multiple terminal windows and panes, and keep terminal sessions running in the background.

## Usage

Run from the repository root:

```bash
bash 006-tmux/install.sh
```

## Quick reference

Prefix: `Ctrl-a` (press it twice to send a literal `Ctrl-a`).

| Action                       | Command / keys                                       |
| ---------------------------- | ---------------------------------------------------- |
| New, list, reattach session  | `tmux new -s name`, `tmux ls`, `tmux attach -t name` |
| Detach, keep session running | `Ctrl-a`, `d`                                        |
| Split pane / new window      | `Ctrl-a`, `h` / `v` / `c`                            |
| Move between panes           | `Alt-h/j/k/l`                                        |
| Resize pane                  | `Ctrl-a`, `H/J/K/L`                                  |
| Copy mode, select, copy      | `Ctrl-a`, `[`, `v`, `y`                              |
| Save / restore session       | `Ctrl-a`, `Ctrl-s` / `Ctrl-r`                        |
| Install newly added plugins  | `Ctrl-a`, `Shift-i`                                  |
