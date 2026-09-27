#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required to install GnuPG." >&2
    exit 1
fi

echo "Installing GnuPG and pinentry-mac..."
brew install -q gnupg pinentry-mac

gnupg_dir="$HOME/.gnupg"
config_source="$script_dir/config/gpg-agent.conf"
config_target="$gnupg_dir/gpg-agent.conf"

mkdir -p "$gnupg_dir"
chmod 700 "$gnupg_dir"

if [[ -e "$config_target" || -L "$config_target" ]]; then
    echo "GnuPG agent configuration already exists; leaving it unchanged."
else
    cp "$config_source" "$config_target"
fi

zshrc_target="$HOME/.zshrc"
gpg_tty_setting='export GPG_TTY="$(tty)"'
if ! grep -Fqx -- "$gpg_tty_setting" "$zshrc_target" 2>/dev/null; then
    if [[ -s "$zshrc_target" ]]; then
        printf '\n' >> "$zshrc_target"
    fi
    cat "$script_dir/config/.zshrc" >> "$zshrc_target"
fi

if command -v gpg >/dev/null 2>&1; then
	echo "GnuPG installation completed."
    echo "Run gpg --full-generate-key to create a new GnuPG key."
    read -r -p "Press Enter to proceed..."
else
	echo "GnuPG installation failed: gpg is not available in PATH." >&2
	exit 1
fi
