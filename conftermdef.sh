#!/bin/bash

pacman -S wget git curl vim

wget https://github.com/iJoseG/Mscripts/raw/refs/heads/main/prruebashell.zip

unzip prruebashell.zip -d ~

cd ~/pruebashell 

cp -r . ~

chsh -s /bin/zsh
