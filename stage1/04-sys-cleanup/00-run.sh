#!/bin/bash -e

on_chroot << EOF
#apt-get -y purge 

#apt-get -y --purge autoremove
#apt-get clean

#rm -rf /usr/share/man/??
#rm -rf /usr/share/man/??_*
EOF
