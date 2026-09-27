# 🔐 GnuPG

The GNU Privacy Guard.

GnuPG creates the key used to sign Git commits, allowing GitHub to verify their authenticity. See [GitHub's documentation on commit signature verification](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification).

## Usage

Run from the repository root:

```bash
bash 001-gnupg/install.sh
```

Installs GnuPG and `pinentry-mac`, then copies the repository's GnuPG agent configuration to `~/.gnupg/gpg-agent.conf` if no local configuration already exists.

The installer pauses so you can create the key manually in another terminal; press Enter in the installer when you are done.
