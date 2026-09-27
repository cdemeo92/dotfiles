#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required to install ripgrep." >&2
    exit 1
fi

echo "Installing ripgrep..."
brew install -q ripgrep

if ! command -v rg >/dev/null 2>&1; then
    echo "ripgrep installation failed: rg is not available in PATH." >&2
    exit 1
fi

echo "ripgrep installation completed."