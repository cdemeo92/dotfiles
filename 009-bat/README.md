# bat

`bat` is a `cat` alternative with syntax highlighting, line numbers, and Git changes.

## Install

```bash
bash 009-bat/install.sh
```

## Quick reference

| Task | Example |
| --- | --- |
| Display a file with syntax highlighting | `bat file.py` |
| Display without a pager | `bat --paging=never file.py` |
| Display selected lines | `bat --line-range 10:20 file.py` |
| List supported languages | `bat --list-languages` |