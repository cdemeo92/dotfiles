#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required to install Vim." >&2
    exit 1
fi

echo "Installing Vim..."
brew install -q vim

if ! command -v vim >/dev/null 2>&1; then
    echo "Vim installation failed: vim is not available in PATH." >&2
    exit 1
fi

vimrc_target="$HOME/.vimrc"
if [[ -e "$vimrc_target" ]]; then
    echo "Vim config already exists; leaving it unchanged."
else
    cp "$script_dir/config/.vimrc" "$vimrc_target"
fi

echo "Vim installation completed."
