# Homebrew

Installs Homebrew on macOS if it is not already available in `PATH`.

## Usage

Run from the repository root:

```bash
bash 000-brew/install.sh
```

Or run it from this folder:

```bash
bash install.sh
```

The script exits successfully without reinstalling Homebrew when `brew` is already available. Otherwise, it runs the official Homebrew installer and verifies that `brew` is available afterward.
