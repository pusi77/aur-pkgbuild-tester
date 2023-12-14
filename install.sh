#!/usr/bin/env bash

INSTALL_DIR="/opt/aur-pkgbuild-tester"
USR="$(whoami)"

echo "Root permission required to install the package"
sudo rm -fr "$INSTALL_DIR" 2> /dev/null || true
sudo mkdir -p "$INSTALL_DIR"
sudo chown "$USR:$USR" "$INSTALL_DIR"
git clone https://github.com/pusi77/aur-pkgbuild-tester.git "$INSTALL_DIR" > /dev/null 2>&1

find "$INSTALL_DIR" -type f -iname "*.sh" -exec chmod +x {} \;
sudo ln -sf "$INSTALL_DIR/aur-pkgbuild-tester.sh" /usr/local/bin/aur-pkgbuild-tester

echo "aur-pkgbuild-tester has been installed to $INSTALL_DIR"
echo "You can now run it using the 'aur-pkgbuild-tester' command."

