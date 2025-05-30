#!/usr/bin/bash

ff() {
    if [[ "$1" == "-c" ]]; then
        clear
    fi
    fastfetch --config examples/13
}
