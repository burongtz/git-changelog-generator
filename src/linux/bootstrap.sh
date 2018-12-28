#!/bin/bash

# Get project path
if [ $# -eq 0 ]; then
    projectPath=$(pwd)
else
    projectPath=$1
fi

# Validate path of directory
if [ ! -d $projectPath ]; then
    echo "$projectPath doesn't exists or is not a directory."
    exit 1
fi