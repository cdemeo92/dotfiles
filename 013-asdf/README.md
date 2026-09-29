# asdf

`asdf` manages versions of multiple languages and tools using plugins and `.tool-versions` files.

## Install

```bash
bash 013-asdf/install.sh
```

## Quick reference

| Task                                  | Command                      |
| ------------------------------------- | ---------------------------- |
| Add the Node.js plugin                | `asdf plugin add nodejs`     |
| List available Node.js versions       | `asdf list all nodejs`       |
| Install a Node.js version             | `asdf install nodejs latest` |
| Set a version for the current project | `asdf set nodejs <version>`  |
| Show active tool versions             | `asdf current`               |

asdf and nvm can both manage Node.js; choose one for a project to avoid version-selection conflicts.
