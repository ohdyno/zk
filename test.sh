#!/bin/bash
# Tests for the zk program

source "./lib/assert.sh"

assert "./zk.sh find 'test1'" "./test2.md:1:[[test1]]"

assert "./zk.sh generate 'test1'" "[[test1]]"

assert "./zk.sh generate | wc -m | tr -d \[:space:\]" "16"

assert "./zk.sh | head -n1 | sed -e 's/:.*$//'" "Usage"

assert_end "Zettelkasten"
