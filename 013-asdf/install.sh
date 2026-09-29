#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v asdf >/dev/null 2>&1; then
    if ! command -v brew >/dev/null 2>&1; then
        echo "Homebrew is required to install asdf." >&2
        exit 1
    fi

    echo "Installing asdf..."
    brew install -q --no-ask asdf
fi

if ! command -v asdf >/dev/null 2>&1; then
    echo "asdf installation failed: asdf is not available in PATH." >&2
    exit 1
fi

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

echo "asdf installation completed."