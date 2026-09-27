#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_source="$script_dir/config/.zshrc"
zshrc_target="$HOME/.zshrc"
missing_lines=()

while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -n "$line" ]] || continue
    if ! grep -Fqx -- "$line" "$zshrc_target" 2>/dev/null; then
        missing_lines+=("$line")
    fi
done < "$config_source"

if [[ ${#missing_lines[@]} -gt 0 ]]; then
    if [[ -s "$zshrc_target" ]]; then
        printf '\n' >> "$zshrc_target"
    fi
    printf '%s\n' "${missing_lines[@]}" >> "$zshrc_target"
fi