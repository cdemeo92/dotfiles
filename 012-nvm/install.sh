#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required to install nvm." >&2
    exit 1
fi

if ! brew list --versions nvm >/dev/null 2>&1; then
    echo "Installing nvm..."
    brew install -q --no-ask nvm
fi

nvm_script="$(brew --prefix nvm)/nvm.sh"
if [[ ! -s "$nvm_script" ]]; then
    echo "nvm installation failed: nvm.sh was not found." >&2
    exit 1
fi

mkdir -p "$HOME/.nvm"
zshrc_target="$HOME/.zshrc"
missing_lines=()

while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -n "$line" ]] || continue
    if ! grep -Fqx -- "$line" "$zshrc_target" 2>/dev/null; then
        missing_lines+=("$line")
    fi
done < "$script_dir/config/.zshrc"

if [[ ${#missing_lines[@]} -gt 0 ]]; then
    if [[ -s "$zshrc_target" ]]; then
        printf '\n' >> "$zshrc_target"
    fi
    printf '%s\n' "${missing_lines[@]}" >> "$zshrc_target"
fi

echo "nvm installation completed."