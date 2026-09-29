# dotfiles

Personal scripts and configuration for setting up a new computer.

## Install

Clone the repository:

```bash
git clone https://github.com/cdemeo92/dotfiles.git
cd dotfiles
```

Run the installer from the repository root:

```bash
./install.sh
```

To run only selected tools, pass their names:

```bash
./install.sh <tool> [tool ...]
```

To install everything except selected tools, put `-` before their names:

```bash
./install.sh - <tool> [tool ...]
```

Excluded names that do not match a tool are ignored.

Without arguments, the
installer runs every tool in numeric-prefix order; when selecting tools by
name, it runs them in the order provided.

## Project structure

Each numbered tool folder contains an `install.sh` that performs that tool's installation and can also be run on its own.
The root `install.sh` discovers the tool folders and executes their `install.sh` scripts, in numeric order by default or in the provided order when specific tools are selected.

```text
dotfiles/
├── NNN-[tool-name]/
│   ├── config/ (optional)
│   └── install.sh
└── install.sh
```

## Available tools

- [brew](000-brew/README.md)
- [gnupg](001-gnupg/README.md)
- [git](002-git/README.md)
- [jq](003-jq/README.md)
- [ripgrep](004-ripgrep/README.md)
- [vim](005-vim/README.md)
- [tmux](006-tmux/README.md)
- [zsh](999-zsh/README.md)
