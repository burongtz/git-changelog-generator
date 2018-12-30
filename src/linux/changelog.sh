#!/bin/bash

get_tokens() {
    local tokens=(
        "Added:"
        "Changed:"
        "Deprecated:"
        "Removed:"
        "Fixed:"
        "Security:"
    )
    echo "${tokens[*]}"
}

filter_by_tokens() {
    local expGrep=""
    local expSeparator=""

    if [ $# -eq 0 ]; then
        echo "Nothing to filter on filter_by_tokens!"
        return 1 #failure
    fi

    for token in $(get_tokens); do
        expGrep+=$expSeparator
        expGrep+=$token
        expSeparator="\|"
    done

    echo "$1" | grep "$expGrep"
    return 0 #success
}

save_changelog() {
    local changelogName="CHANGELOG.md"

    if [ $# -lt 2 ]; then
        echo "Nothing to save as changelog, missing parametters!"
        return 1
    fi

    echo "$2" >> "$1/$changelogName"

    return 0
}