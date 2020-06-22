#!/bin/sh
#
# Shell-based Zettelkasten commands

usage()
{
    cat <<EOF
Usage: $0 <command>

command		argument	description
-------------------------------------------
find		link		find any [[.*link.*]]
generate	id?		create [[id]] if specified, otherwise generate a [[timestamp]] to be used as link
EOF

  exit 0
}

find_link() {
    local pattern=$1
    grep "\[\[.*$pattern.*\]\]" --include "*.md" --recursive . --line-number --color=never
    exit 0
}

generate_id() {
    if test -z "$1"; then
        local id=`date -ju "+%Y%m%d%H%M"`
    else
	local id=$1
    fi
    printf "[[%s]]" $id
    exit 0
}

command=$1
arg=$2
case $command in
    "find")
        find_link $arg
        ;;
    "generate")
        generate_id $arg
        ;;
esac

usage
