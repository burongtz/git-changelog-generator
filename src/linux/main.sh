#!/bin/bash

### Global vars
projectPath=""
rootPathScript=$(dirname $0)

### Imports
. $rootPathScript/bootstrap.sh
. $rootPathScript/git.sh

test=$(get_formated_git_log)
echo "$test"

exit 0