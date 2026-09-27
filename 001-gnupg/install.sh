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

echo "GnuPG installed."
