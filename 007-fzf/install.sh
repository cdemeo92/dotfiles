#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required to install fzf." >&2
    exit 1
fi

echo "Installing fzf..."
brew install -q --no-ask fzf

if ! command -v fzf >/dev/null 2>&1; then
    echo "fzf installation failed: fzf is not available in PATH." >&2
    exit 1
fi

echo "fzf installation completed."