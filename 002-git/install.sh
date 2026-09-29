#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v git >/dev/null 2>&1; then
	if ! command -v brew >/dev/null 2>&1; then
		echo "Homebrew is required to install Git." >&2
		exit 1
	fi

	echo "Installing Git..."
	brew install -q --no-ask git
fi

if ! command -v git >/dev/null 2>&1; then
	echo "Git installation failed: git is not available in PATH." >&2
	exit 1
fi

personal_config="$HOME/.gitconfig-personal"
if [[ -e "$personal_config" ]]; then
	echo "Personal Git config already exists; leaving it unchanged."
else
	cp "$script_dir/config/.gitconfig-personal" "$personal_config"
fi

include_key='includeIf.gitdir:~/Desktop/Projects/.path'
git config --global --replace-all "$include_key" '~/.gitconfig-personal'

user_email="$(git config --file "$personal_config" --get user.email)"
signing_key=""
if command -v gpg >/dev/null 2>&1; then
	signing_key="$(gpg --list-secret-keys --with-colons --fingerprint "$user_email" 2>/dev/null | awk -F: '$1 == "sec" { secret = 1; next } secret && $1 == "fpr" { print $10; exit }' || true)"
fi

if [[ -n "$signing_key" ]]; then
	git config --file "$personal_config" --replace-all user.signingkey "$signing_key"
	git config --file "$personal_config" --replace-all commit.gpgsign true
	git config --file "$personal_config" --replace-all tag.gpgsign true
	echo "GPG signing enabled for the available key."
else
	echo "No GPG secret key found for $user_email; GPG signing is not enabled."
fi

echo "Git installation completed."
