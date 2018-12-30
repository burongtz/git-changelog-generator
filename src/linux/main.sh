#!/bin/bash

rootPathScript=$(dirname $0)

. $rootPathScript/bootstrap.sh
. $rootPathScript/git.sh
. $rootPathScript/changelog.sh

gitLogFormatted=$(get_formated_git_log)
gitLogfiltered=$(filter_by_tokens "$gitLogFormatted")
contentChangeLog=$(create_content_changelog "$gitLogfiltered")

save_changelog $(pwd) "$contentChangeLog"

exit 0