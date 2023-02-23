#!/bin/zsh

input_file=$1
replacement="$2"

# Route paths commonly includes template variables for substitution; this script handles the most common ones and replaces them with the given input.
# It could be used in a loop to brute force multiple routes, or it could be used to try out a known ID against multiple routes, for example.

routes=( $(sed "s/{.*}/$replacement/" $input_file |  sed -E 's/:.*(\/|$)/'"$replacement"'\//') )
echo ${(u)routes} | tr ' ' '\n'

