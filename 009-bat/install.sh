#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required to install bat." >&2
    exit 1
fi

echo "Installing bat..."
brew install -q --no-ask bat

if ! command -v bat >/dev/null 2>&1; then
    echo "bat installation failed: bat is not available in PATH." >&2
    exit 1
fi

echo "bat installation completed."