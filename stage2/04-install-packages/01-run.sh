#!/bin/bash -e

install -m 644 files/interfaces-local "${ROOTFS_DIR}/etc/network/interfaces.d/"
on_chroot << EOF
systemctl enable ifplugd
usermod -a -G tcpdump pi
EOF

#sed -i 's/^TFTP_ADDRESS.*/TFTP_ADDRESS="0.0.0.0:69"/' "${ROOTFS_DIR}/etc/default/tftpd-hpa"
#on_chroot << EOF
#usermod -a -G tftp pi
#chown -R tftp:tftp "/srv/tftp"
#chmod 774 "/srv/tftp"
#EOF

#on_chroot << EOF
#loginctl enable-linger
#EOF

#echo 'nameserver 127.0.0.1
#nameserver ::1
#options trust-ad' > "${ROOTFS_DIR}/etc/resolv.conf"

#install -m 644 files/unbound-local.conf "${ROOTFS_DIR}/etc/unbound/unbound.conf.d/"
#wget https://www.internic.net/domain/named.root -qO- | tee "${ROOTFS_DIR}/var/lib/unbound/root.hints"
