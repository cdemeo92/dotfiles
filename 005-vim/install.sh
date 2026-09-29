#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required to install Vim." >&2
    exit 1
fi

echo "Installing Vim..."
brew install -q --no-ask vim

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

plug_file="$HOME/.vim/autoload/plug.vim"
if [[ ! -f "$plug_file" ]]; then
    echo "Installing vim-plug..."
    curl -fLo "$plug_file" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Installing Vim plugins..."
vim -Nu "$script_dir/config/.vimrc" -n -es -c 'PlugInstall --sync' -c 'qa!'

echo "Vim installation completed."
