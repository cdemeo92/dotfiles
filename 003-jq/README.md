# jq

Lightweight and flexible command-line JSON processor. `jq` reads, filters, and transforms JSON from files or standard input.

## Usage

Run from the repository root:

```bash
bash 003-jq/install.sh
```

## Quick reference

| Task                             | Example                                         |
| -------------------------------- | ----------------------------------------------- |
| Format JSON                      | `jq . data.json`                                |
| Read a field                     | `jq '.name' data.json`                          |
| Get a field from each array item | `jq '.[].name' data.json`                       |
| Filter array items               | `jq '.[] \| select(.active == true)' data.json` |
| Transform JSON                   | `jq '.active = true' data.json > new_data.json` |

`jq` writes results to standard output; redirect to a new file to save them. It does not modify the input file in place.
