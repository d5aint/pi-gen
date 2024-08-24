#!/bin/bash -e

#install -m 644 files/tft35a.dtbo "${ROOTFS_DIR}/boot/firmware/overlays/"

#install -m 644 files/interfaces-local "${ROOTFS_DIR}/etc/network/interfaces.d/"

install -v -m 0755 -o 1000 -g 1000 -d "${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}"/.config/openbox
install -m 755 -o 1000 -g 1000 files/autostart "${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}/.config/openbox/"
 
#HOME="${ROOTFS_DIR}/home/${FIRST_USER_NAME}"
#mkdir -p "${HOME}/.config/openbox/"
#install -m 755 -o 1000 -g 1000 files/.xinitrc "${HOME}/"
#install -m 755 -o 1000 -g 1000 files/.xsession "${HOME}/"

install -m 644 -o 1000 -g 1000 files/rc.xml "${HOME}/.config/openbox/"

#on_chroot << EOF
#SUDO_USER="${FIRST_USER_NAME}" python -m venv --system-site-packages .env
#EOF

on_chroot << EOF
#systemctl enable ifplugd
usermod -a -G tcpdump pi
EOF

#sed -i 's/^TFTP_ADDRESS.*/TFTP_ADDRESS="0.0.0.0:69"/' "${ROOTFS_DIR}/etc/default/tftpd-hpa"
#on_chroot << EOF
#usermod -a -G tftp pi
#chown -R tftp:tftp "/srv/tftp"
#chmod 774 "/srv/tftp"
#EOF

#install -m 644 files/custom.toml "${ROOTFS_DIR}/boot/firmware/"
#FIRSTUSERPASS=`echo "$FIRST_USER_PASS" | openssl passwd -5 -stdin`

#sed -i -e "s|TARGET_HOSTNAME|${TARGET_HOSTNAME}|g" \
#  -e "s|FIRST_USER_NAME|${FIRST_USER_NAME}|" \
#  -e "s|FIRST_USER_PASS|${FIRSTUSERPASS}|" \
#  -e "s|PUBKEY_SSH_FIRST_USER|${PUBKEY_SSH_FIRST_USER}|" \
#  -e "s|WPA_COUNTRY|${WPA_COUNTRY}|" \
#  -e "s|KEYBOARD_KEYMAP|${KEYBOARD_KEYMAP}|" \
#  -e "s|TIMEZONE_DEFAULT|${TIMEZONE_DEFAULT}|" "${ROOTFS_DIR}/boot/firmware/custom.toml"

#on_chroot << EOF
#loginctl enable-linger
#EOF

#echo 'nameserver 127.0.0.1
#nameserver ::1
#options trust-ad' > "${ROOTFS_DIR}/etc/resolv.conf"

#install -m 644 files/unbound-local.conf "${ROOTFS_DIR}/etc/unbound/unbound.conf.d/"
#wget https://www.internic.net/domain/named.root -qO- | tee "${ROOTFS_DIR}/var/lib/unbound/root.hints"
