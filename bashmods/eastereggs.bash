#!/usr/bin/bash

shutup() { echo "-נעלב-"; }

stfu()  { echo "no u"; }

() { echo "yoo linus"; }

() { echo "yoo double linus"; }

() { echo "fuck you"; }

slay() {
  COLORS=(95 96 93 92 91 94)  # magenta, cyan, yellow, green, red, blue

  MESSAGES=(
    "✨ SLAY QUEEN ✨"
    "💅 Nails done. Hair laid. Terminal slain."
    "✨ The legend bashes here."
  )

  type_out() {
    local text="$1"
    local color="$2"
    for ((i=0; i<${#text}; i++)); do
      echo -ne "\e[1;${color}m${text:i:1}\e[0m"
      sleep 0.03
    done
    echo
  }

  sparkle() {
    for bright in 90 37 90; do
      echo -ne "\r\e[${bright}m✨✨✨✨✨✨✨✨✨✨\e[0m"
      sleep 0.15
    done
    echo -ne "\r\e[K"
  }

  rainbow_wave() {
    local text="$1"
    local length=${#text}
    local colors=(31 33 32 36 34 35) # red, yellow, green, cyan, blue, magenta
    for shift in {0..15}; do
      echo -ne "\r"
      for ((i=0; i<length; i++)); do
        color=${colors[$(( (i + shift) % ${#colors[@]} ))]}
        char="${text:i:1}"
        echo -ne "\e[1;${color}m${char}\e[0m"
      done
      sleep 0.1
    done
    echo
  }

  for i in "${!MESSAGES[@]}"; do
    if [[ $i -lt $((${#MESSAGES[@]} - 1)) ]]; then
      type_out "${MESSAGES[i]}" "${COLORS[i % ${#COLORS[@]}]}"
      sparkle
    else
      rainbow_wave "${MESSAGES[i]}"
    fi
  done
}
