#!/bin/bash

. ~/.fancy-git/version.sh

fg_script_help() {
    sh ~/.fancy-git/help.sh | less
}

fg_show_version() {
    local current_year
    current_year=$(date +%Y)
    echo " Fancy Git v$FANCYGIT_VERSION (c) $current_year by Diogo Alexsander Cavilha <diogocavilha@gmail.com>."
    echo ""
}

fg_update() {
    local current_dir
    current_dir=$(pwd)
    cd ~/.fancy-git/ && git pull
    cd "$current_dir" || return
    cat ~/.fancy-git/CHANGELOG.md
}

fg_command_not_found() {
    echo ""
    echo " $1: Command not found."
    fg_script_help
}

fg_change_mode()
{
    local current_dir
    current_dir=$(pwd)
    cd ~/.fancy-git/ && git checkout "$1"
    cd "$current_dir" || return
    echo ""
    echo " If you cannot see any changes yet, please restart the terminal."
    echo ""
}

fg_fancygit_reload() {
    . ~/.bashrc
}

case $1 in
    "-h"|"--help") fg_script_help;;
    "-v"|"--version") fg_show_version;;
    "update") fg_update;;
    "default") fg_change_mode "master";;
    "simple") fg_change_mode "simple";;
    *) fg_command_not_found "$1";;
esac
