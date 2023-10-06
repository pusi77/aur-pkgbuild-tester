#!/usr/bin/env bash

INSTALL_DIR="/opt/aur-pkgbuild-tester"

if [ "$(id -u)" -ne 0 ]; then
  echo "This install script must be run as root using sudo. Please re-run it with sudo:"
  echo "sudo $0"
  exit 1
fi

sudo rm -fr "$INSTALL_DIR"
sudo rm /usr/local/bin/aur-pkgbuild-tester