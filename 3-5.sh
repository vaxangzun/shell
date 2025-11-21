#!/usr/bin/env bash

run_ls() {
    cmd="ls $@"
    eval "$cmd"
}

run_ls "$@"
