#!/bin/bash

get_formated_git_log() {
    local dateFormat="--date=format-local:%Y-%m-%d %H:%M:%S"
    local logFormat="--pretty=tformat:%cd | %h | %s"

    git log --no-merges "$dateFormat" "$logFormat" "$@"
}