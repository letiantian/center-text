#!/usr/bin/env bash

function get_width () {
    echo "$(wc -L <<< "$1")"
}

function multi_space() {
    num=$1
    if [ $num -le 0 ]; then
        echo ""
        return
    fi
    v=$(printf "%-${num}s" " ")
    echo "$v"
}

columns="$(tput cols)"

for line in "$@"
do
    width=$(get_width "$line")
    left_padding=$(( (columns-width) / 2))
    if [ $left_padding -lt 0 ]; then
        left_padding=0
    fi
    spaces=$(multi_space "$left_padding")
    printf "%s%s\n" "$spaces" "$line"
done

#
# Thanks:
# http://stackoverflow.com/questions/5799303/print-a-character-repeatedly-in-bash
# http://stackoverflow.com/questions/918886/how-do-i-split-a-string-on-a-delimiter-in-bash
# http://stackoverflow.com/questions/36380867/how-to-get-the-number-of-columns-occupied-by-a-character-in-terminal
# http://superuser.com/questions/823883/how-to-justify-and-center-text-in-bash 
# 