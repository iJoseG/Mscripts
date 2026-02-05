#!/bin/bash
set -e

### GPU detection ###
GPU=$(lspci | grep -E "VGA|3D")

if echo "$GPU" | grep -qi amd; then
  echo "amd"
elif echo "$GPU" | grep -qi intel; then
  echo "intel"
elif echo "$GPU" | grep -qi nvidia; then
  echo "nvidia"
fi