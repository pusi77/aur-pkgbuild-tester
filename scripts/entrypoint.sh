#!/bin/bash
set -e
# Create user
useradd -m -g wheel -s /bin/sh tester
echo "tester ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
chown -R tester:wheel /opt/pkgdir
# remove old package files
cd /opt/pkgdir
rm -f *.tar.zst
# Install makepkg deps
pacman -Sy --needed base-devel git --noconfirm
# install paru
su - tester /opt/scripts/install-paru.sh
# install dependencies
su - tester /opt/scripts/install-dependencies.sh
# Build the package as `tester' user
su - tester /opt/scripts/build-pkg.sh
# Install the package
cd /opt/pkgdir
pacman -U *.tar.zst --noconfirm
# Run the test
if test -f /opt/test.sh; then
    bash /opt/test.sh
fi


