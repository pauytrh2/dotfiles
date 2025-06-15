#!/usr/bin/bash

dload() { yay -S "$1"; }

yay() {
  if [[ "$1" == "-R" ]]; then
    shift
    command yay -Rns "$@"
  else
    command yay "$@"
  fi
}

