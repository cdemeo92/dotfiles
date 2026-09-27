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

When tool names are provided, they run in the given order. Without arguments,
the installer runs every tool in this repo in numeric-prefix order.

## Project structure

Each numbered tool folder contains an `install.sh` that performs that tool's installation and can also be run on its own.
The root `install.sh` discovers the tool folders and executes their `install.sh` scripts, in numeric order by default or in the provided order when specific tools are selected.

```text
dotfiles/
├── NNN-[tool-name]/
│   └── install.sh
└── install.sh
```

## Available tools

- [brew](000-brew/README.md)
