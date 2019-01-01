#!/bin/bash

# 
#   ____            _         __                  _   _                 
#  | __ )  __ _ ___(_) ___   / _|_   _ _ __   ___| |_(_) ___  _ __  ___ 
#  |  _ \ / _` / __| |/ __| | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
#  | |_) | (_| \__ \ | (__  |  _| |_| | | | | (__| |_| | (_) | | | \__ \
#  |____/ \__,_|___/_|\___| |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
#                                                                       
# 

import() {
    . "$(get_path_scripts)/$1" > /dev/null 2>&1
}

get_path_scripts() {
    echo "$(dirname $0)"
}

validate_path_project() {
    local path=$1

    if [ ! -d $path ]; then
        echo "$path doesn't exists or is not a directory."
        exit 1
    fi
}

# 
#   ___                            _        _   _                 
#  |_ _|_ __ ___  _ __   ___  _ __| |_ __ _| |_(_) ___  _ __  ___ 
#   | || '_ ` _ \| '_ \ / _ \| '__| __/ _` | __| |/ _ \| '_ \/ __|
#   | || | | | | | |_) | (_) | |  | || (_| | |_| | (_) | | | \__ \
#  |___|_| |_| |_| .__/ \___/|_|   \__\__,_|\__|_|\___/|_| |_|___/
#                |_|                                              
# 

import "git.sh"
import "changelog.sh"

# 
#   __  __       _       
#  |  \/  | __ _(_)_ __  
#  | |\/| |/ _` | | '_ \ 
#  | |  | | (_| | | | | |
#  |_|  |_|\__,_|_|_| |_|
#                        
# 

gitPathProject=""
gitLogFormatted=""
gitLogfiltered=""
contentChangeLog=""

if [ $# -eq 0 ]; then
    gitPathProject=$(pwd)
else
    gitPathProject=$1
fi

validate_path_project $gitPathProject

gitLogFormatted=$(get_formated_git_log)
gitLogfiltered=$(filter_by_tokens "$gitLogFormatted")
contentChangeLog=$(create_content_changelog "$gitLogfiltered")

save_changelog $(pwd) "$contentChangeLog"

exit 0