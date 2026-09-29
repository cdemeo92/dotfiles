# fd

`fd` is a fast, convenient alternative to `find` for locating files and directories.

## Install

```bash
bash 008-fd/install.sh
```

## Quick reference

| Task | Example |
| --- | --- |
| Find a file or directory by name | `fd 'pattern'` |
| Search under a directory | `fd 'pattern' src/` |
| Find files with an extension | `fd -e ts 'pattern'` |
| Include hidden and ignored paths | `fd --hidden --no-ignore 'pattern'` |