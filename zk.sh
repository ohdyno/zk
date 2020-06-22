#!/bin/sh
#
# Shell-based Zettelkasten commands

usage()
{
  printf "Usage: $0 [-f pattern] [-g]\n"
  printf "%s\t%s\n" "-f" "find pattern within link names (denoted by [[]])"
  printf "%s\t%s\n" "-g" "generate unique id links"
  exit 0
}

find_link() {
    pattern=$1
    grep "\[\[.*$pattern.*\]\]" --include "*.md" --recursive . --line-number --color=never
    exit 0
}

generate_id() {
    id=`date -ju "+%Y%m%d%H%M"`
    printf "[[%s]]" $id
    exit 0
}

while getopts ':f:g' opt
do
    case $opt in
        f)
            find_link $OPTARG
            ;;
        g)
            generate_id
            ;;
   esac
done

usage
