#!/bin/bash -e

sed -i "s/^#NTP=/NTP=us.pool.ntp.org/" \
 "${ROOTFS_DIR}/etc/systemd/timesyncd.conf"
 
echo 'nameserver 1.1.1.1
nameserver 1.0.0.1
nameserver 2606:4700:4700::1111' > "${ROOTFS_DIR}/etc/resolv.conf"
