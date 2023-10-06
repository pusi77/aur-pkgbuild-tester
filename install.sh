#!/usr/bin/env bash

INSTALL_DIR="/opt/aur-pkgbuild-tester"

if [ "$(id -u)" -ne 0 ]; then
  echo "This install script must be run as root using sudo. Please re-run it with sudo:"
  echo "sudo $0"
  exit 1
fi

sudo mkdir -p "$INSTALL_DIR"
sudo chown "$(whoami):$(whoami)" "$INSTALL_DIR"
git clone https://github.com/pusi77/aur-pkgbuild-tester.git "$INSTALL_DIR" > /dev/null 2>&1

chmod +x "$INSTALL_DIR/aur-pkgbuild-tester.sh"
sudo ln -s "$INSTALL_DIR/aur-pkgbuild-tester.sh" /usr/local/bin/aur-pkgbuild-tester

echo "aur-pkgbuild-tester has been installed to $INSTALL_DIR"
echo "You can now run it using the 'aur-pkgbuild-tester' command."

