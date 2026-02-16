#!/bin/bash

sudo pacman -S openrazer-daemon linux-headers openrazer-driver-dkms

yay -S polychromatic

sudo gpasswd -a $USER openrazer

reboot

