#!/bin/bash
set -e
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si --noconfirm
cd ..
rm -rf paru-bin
