#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required to install fd." >&2
    exit 1
fi

echo "Installing fd..."
brew install -q --no-ask fd

if ! command -v fd >/dev/null 2>&1; then
    echo "fd installation failed: fd is not available in PATH." >&2
    exit 1
fi

echo "fd installation completed."