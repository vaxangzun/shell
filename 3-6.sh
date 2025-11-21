#!/usr/bin/env bash

if [ $# -lt 3 ]; then
    echo "사용법: $0 실행파일 arg1 arg2 ..."
    exit 1
fi

prog="$1"
shift

./"$prog" "$@"

