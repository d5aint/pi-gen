#!/bin/bash -e

sed -i "s/^#NTP=/NTP=us.pool.ntp.org/" "${ROOTFS_DIR}/etc/systemd/timesyncd.conf"

echo "${TIMEZONE_DEFAULT}" > "${ROOTFS_DIR}/etc/timezone"
rm "${ROOTFS_DIR}/etc/localtime"

on_chroot << EOF
dpkg-reconfigure -f noninteractive tzdata
EOF
