#!/bin/bash

USER=${1}
TEAM=${2}

# This script will ask you for an access token for each page.
# Generate an access token by going to personal settings and creating an app password.

NEXT_URL="https://api.bitbucket.org/2.0/repositories/${TEAM}?pagelen=100"

while [ ! -z $NEXT_URL ] && [ $NEXT_URL != "null" ]
do
    curl -u $USER $NEXT_URL > repoinfo.json
    jq -r '.values[] | .links.clone[1].href' repoinfo.json > ../repos.txt
    NEXT_URL=`jq -r '.next' repoinfo.json`

    for repo in `cat ../repos.txt`
    do
        echo "Cloning" $repo
        if echo "$repo" | grep -q ".git"; then
            command="git"
        else
            command="hg"
        fi
        $command clone $repo
    done
done
