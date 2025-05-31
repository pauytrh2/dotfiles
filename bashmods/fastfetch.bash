#!/usr/bin/bash

ff() {
    if [[ "$1" == "-c" ]]; then
        clear
    fi
    fastfetch --config ~/bashmods/fastfetch/biff.jsonc
}
