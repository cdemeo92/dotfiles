#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required to install eza." >&2
    exit 1
fi

echo "Installing eza..."
brew install -q --no-ask eza

if ! command -v eza >/dev/null 2>&1; then
    echo "eza installation failed: eza is not available in PATH." >&2
    exit 1
fi

echo "eza installation completed."