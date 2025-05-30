#!/usr/bin/bash

ftxt() { sudo nano $(fzf --preview 'cat {}'); }
