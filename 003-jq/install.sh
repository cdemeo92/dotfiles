#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required to install jq." >&2
    exit 1
fi

echo "Installing jq..."
brew install -q jq

if ! command -v jq >/dev/null 2>&1; then
    echo "jq installation failed: jq is not available in PATH." >&2
    exit 1
fi

echo "jq installation completed."