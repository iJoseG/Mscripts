#!/bin/bash

sudo apt install git makepkg

git clone https://aur.archlinux.org/packettracer.git

cd packettracer

makepkg -si


