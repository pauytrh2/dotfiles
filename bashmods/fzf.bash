#!/usr/bin/bash

eval "$(fzf --bash)" # set up fzf
ftxt() { sudo nano $(fzf --preview "bat --color=always {}"); }
