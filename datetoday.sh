#!/bin/bash

# Este script te dirá que día es hoy y el clima

diahoy=$(date "+%A, %d, %B, %Y")

ciudad=$(curl -s ipinfo.io/city)

pais=$(curl -s ipinfo.io/country)

echo " "

echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = ="

echo " "

echo "$diahoy"

curl -s "wttr.in/${ciudad// /-}-${pais}?format=4" 

echo " "

echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = ="

echo " "
