#!/bin/zsh

output_file=$1

# Looks through files in the current dir to find common route declaration patterns, grabbing whatever string is immediately within the parens, then making the list unique and sanitising before going to std out.
# Could be improved with keyword arg handling. 

routes=( $(ack --nobreak --no-filename --match "(?<![a-zA-Z0-9])(Path\(|Get\(|Post\(|Put\(|Patch\(|Delete\(|Trace\()\K(\"(.*?)\"|\'(.*?)\')" --output "\$2") )

echo ${(u)routes} | tr -d "\'\"" | tr ' ' '\n' | sed "s/^\///"

