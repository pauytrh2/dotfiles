#!/usr/bin/bash

ftxt() { sudo nano $(fzf --preview "bat --color=always {}"); }
