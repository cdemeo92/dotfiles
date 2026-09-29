#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v tmux >/dev/null 2>&1; then
    if ! command -v brew >/dev/null 2>&1; then
        echo "Homebrew is required to install tmux." >&2
        exit 1
    fi

    echo "Installing tmux..."
    brew install -q tmux
fi

if ! command -v tmux >/dev/null 2>&1; then
    echo "tmux installation failed: tmux is not available in PATH." >&2
    exit 1
fi

tmux_conf="$HOME/.tmux.conf"
if [[ -e "$tmux_conf" ]]; then
    echo "Tmux config already exists; leaving it unchanged."
else
    cp "$script_dir/config/.tmux.conf" "$tmux_conf"
fi

if grep -Fq "set -g @plugin 'tmux-plugins/tpm'" "$tmux_conf"; then
    tpm_dir="$HOME/.tmux/plugins/tpm"
    if [[ ! -x "$tpm_dir/tpm" ]]; then
        if ! command -v git >/dev/null 2>&1; then
            echo "Git is required to install Tmux Plugin Manager." >&2
            exit 1
        fi

        mkdir -p "$(dirname "$tpm_dir")"
        git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
    fi

    echo "Installing tmux plugins..."
    bash "$tpm_dir/bin/install_plugins"
fi

echo "tmux installation completed."