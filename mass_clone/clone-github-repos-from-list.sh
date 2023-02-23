#!/bin/zsh

account=$1
access_token=$2

while read repo; do
    git clone "https://$2@github.com/$1/$repo";
done

