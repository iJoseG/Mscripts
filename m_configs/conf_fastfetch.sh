#!/bin/bash

sudo pacman -S --needed --noconfirm fastfetch

mkdir -p ~/.config/fastfetch

cat << 'EOF' > ~/.config/fastfetch/config.jsonc
//    ______           __  ______      __
//   / ____/___ ______/ /_/ ____/___ _/ /_
//  / /_  / __ `/ ___/ __/ /   / __ `/ __/
// / __/ / /_/ (__  ) /_/ /___/ /_/ / /_
///_/    \__,_/____/\__/\____/\__,_/\__/
//  https://github.com/m3tozz/FastCat


{
    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
    "logo": {
        "source": "arch_small", // search for logos: fastfetch --list-logos or --print-logos
        "padding": {
	        "top": 1
	},
    },
    "display": {
        "separator": "  "
    },
    "modules": [
	"break",
	"title",
        {
            "type": "os",
            "key": "os    ",
            "keyColor": "33",  // = color3
        },
        {
            "type": "kernel",
            "key": "kernel",
            "keyColor": "33",
        },
        {
            "type": "packages",
            "key": "pkgs  ",
            "keyColor": "33",
        },
        {
            "type": "uptime",
            "format": "{2}h {3}m",
            "key": "uptime",
            "keyColor": "33",
        },
        {
            "type": "memory",
            "key": "memory",
            "keyColor": "33",
        },
        {
            "type": "disk",
            "key": "disk  ",
            "keyColor": "33"
        },
        {
            "type": "command",
            "key": "os age",
            //"keyColor": "magenta",
            "text": "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days",
            "keyColor": "33",
        },
        "break",
    ]
}
EOF
