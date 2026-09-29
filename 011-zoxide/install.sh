#!/usr/bin/env bash
set -euo pipefail

if ! command -v zoxide >/dev/null 2>&1; then
    if ! command -v brew >/dev/null 2>&1; then
        echo "Homebrew is required to install zoxide." >&2
        exit 1
    fi

    echo "Installing zoxide..."
    brew install -q --no-ask zoxide
fi

if ! command -v zoxide >/dev/null 2>&1; then
    echo "zoxide installation failed: zoxide is not available in PATH." >&2
    exit 1
fi

zshrc_target="$HOME/.zshrc"
zoxide_init='eval "$(zoxide init zsh)"'
if ! grep -Fqx -- "$zoxide_init" "$zshrc_target" 2>/dev/null; then
    if [[ -s "$zshrc_target" ]]; then
        printf '\n' >> "$zshrc_target"
    fi
    printf '%s\n' "$zoxide_init" >> "$zshrc_target"
fi

echo "zoxide installation completed."