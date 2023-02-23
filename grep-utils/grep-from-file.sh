#!/bin/zsh

files_to_exclude=$1

# Send a file of things you want to grep for using "<"

while read line; do
    grep -r --exclude="$files_to_exclude" "$line"
done

