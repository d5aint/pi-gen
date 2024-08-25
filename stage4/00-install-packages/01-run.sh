#!/bin/bash -e

install -v -m 644 files/40-libinput.conf "${ROOTFS_DIR}/etc/X11/xorg.conf.d/"

install -v -m 0755 -o 1000 -g 1000 -d "${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}"/.config/openbox
install -v -m 755  -o 1000 -g 1000 files/autostart "${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}/.config/openbox/"
install -v -m 644  -o 1000 -g 1000 files/rc.xml "${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}/.config/openbox/"
#install -v -m 755 -o 1000 -g 1000 files/.xinitrc "${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}/"
#install -v -m 755 -o 1000 -g 1000 files/.xsession "${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}/"

on_chroot << EOF
SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_wayland W1
EOF

on_chroot << EOF
SUDO_USER="${FIRST_USER_NAME}" python -m venv --system-site-packages "${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}/.env"
EOF
