#!/bin/zsh

account="$1"
access_token="$2"

# Github will only do up to 100 per page
# TODO: Rewrite to loop through pages, currently manual incrementation is necessary

curl 'https://'"$access_token"'@api.github.com/orgs/'"$account"'/repos?q=&per_page=100&page=1' |jq -r '.[] | .name'


