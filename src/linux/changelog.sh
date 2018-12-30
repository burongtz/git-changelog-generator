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
    # local tokens=("Add" "Validate") #For testing
    echo "${tokens[*]}"
}

filter_by_tokens() {
    local expGrep=""

    if [ $# -eq 0 ]; then
        echo "Nothing to filter on filter_by_tokens!"
        return 1 #failure
    fi

    expGrep=$(get_tokens_as_exp)

    echo "$1" | grep "$expGrep"
    return 0 #success
}

get_tokens_as_exp() {
    local expGrep=""
    local expSeparator=""

    for token in $(get_tokens); do
        expGrep+=$expSeparator
        expGrep+=$token
        expGrep+=".*"
        expSeparator="\|"
    done

    echo "$expGrep"
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