#!/usr/bin/bash

refresh() {
    sudo cp -r /home/pauytrh/darkweb/www/ /var
    sudo systemctl restart nginx tor
    systemctl status tor
}
