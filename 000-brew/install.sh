#!/usr/bin/env bash
set -euo pipefail

if command -v brew >/dev/null 2>&1; then
	echo "Homebrew is already installed."
	exit 0
fi

echo "Installing Homebrew..."
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | /bin/bash
command -v brew >/dev/null 2>&1
echo "Homebrew installation completed."
