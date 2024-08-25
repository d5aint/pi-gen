on_chroot << EOF
apt-get -y purge debconf-i18n nftables tasksel tasksel-data vim-common vim-tiny

apt-get -y --purge autoremove
apt-get clean
EOF