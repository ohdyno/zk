#!/bin/sh
# Tests for the zk program

set -e

fail() {
    printf "Test Failed. Expected '%s' but got '%s'\n", $expected, $actual
    exit 1
}

actual=`./zk.sh -f 'test1'`
expected="./test2.md:1:[[test1]]"

if [ $actual != $expected ]; then
    fail
fi
