# ripgrep

`rg` searches for text or regular expressions inside files, recursively, while respecting `.gitignore` rules by default.

## Usage

Run from the repository root:

```bash
bash 004-ripgrep/install.sh
```

## Quick reference

| Task | Example |
| --- | --- |
| Search from the current directory | `rg 'TODO'` |
| Search a directory | `rg 'TODO' src/` |
| Ignore case | `rg -i 'todo' src/` |
| List files containing matching text | `rg -l 'TODO'` |
| Search selected file types | `rg 'pattern' -g '*.ts'` |
| List files by name pattern | `rg --files -g '*.ts'` |

Use `rg --help` to see available options and pattern syntax.
