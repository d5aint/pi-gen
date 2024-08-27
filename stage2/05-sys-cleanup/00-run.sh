#!/bin/bash -e

on_chroot << EOF
apt-mark manual alsa-topology-conf alsa-ucm-conf apparmor busybox \
flashrom iw pastebinit python3-distro triggerhappy wireless-regdb

apt-get -y purge debconf-i18n vim-common vim-tiny

#apt-get -y --purge autoremove
#apt-get clean

#rm -rf /usr/share/man/??
#rm -rf /usr/share/man/??_*
EOF
