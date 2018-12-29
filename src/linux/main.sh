#!/bin/bash

### Global vars
projectPath=""
rootPathScript=$(dirname $0)

### Imports
. $rootPathScript/bootstrap.sh
. $rootPathScript/git.sh
. $rootPathScript/changelog.sh

test=$(get_formated_git_log)
# echo "$test"
filter_by_tokens "$test"

exit 0