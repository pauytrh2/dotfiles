#!/usr/bin/bash

MAX=5

up() {
    SNAPSHOTS=($(sudo timeshift --list --verbose | awk '
        /^Snapshot:/ { snap=$2 }
        /^Tags:/ && $2 ~ /O/ { print snap }
    ' | sort -r))

    TO_DELETE=("${SNAPSHOTS[@]:$MAX}")

    for SNAP in "${TO_DELETE[@]}"; do
        echo "Deleting snapshot: $SNAP"
        sudo timeshift --delete --snapshot "$SNAP" --yes
    done

    sudo timeshift --create && yay --noconfirm
    if [ "$1" ]; then
        sudo shutdown now
    fi
}
