#!/usr/bin/env bash
set -e

shopt -s nullglob
directories=([0-9][0-9][0-9]-*/install.sh)
directories=("${directories[@]%/install.sh}")

to_install=()

tools=("${directories[@]#*-}")

for tool in "$@"; do
    found=false
    for i in "${!tools[@]}"; do
        if [[ "${tools[i]}" == "$tool" ]]; then
            to_install+=("${directories[i]}")
            found=true
            break
        fi
    done

    if [[ "$found" == false ]]; then
        echo "Tool $tool not found in available tools."

        suggestion=""
        for name in "${tools[@]}"; do
            if [[ "$name" == "${tool:0:2}"* ]]; then
                suggestion=$name
                break
            fi
        done
        if [[ -n "$suggestion" ]]; then
            echo "Did you mean $suggestion?"
        fi

        exit 1
    fi
done

if [[ ${#to_install[@]} -eq 0 ]]; then
    to_install=("${directories[@]}")
fi

failed_tools=()

for dir in "${to_install[@]}"; do
    echo "Installing ${dir#*-}..."

    if bash "$dir/install.sh"; then
        continue
    else
        result=$?
        echo "Installation failed for ${dir#*-} (exit code $result)." >&2
        failed_tools+=("${dir#*-}")
    fi
done

if [[ ${#failed_tools[@]} -gt 0 ]]; then
    echo "Failed tools: ${failed_tools[*]}" >&2
    exit 1
fi
