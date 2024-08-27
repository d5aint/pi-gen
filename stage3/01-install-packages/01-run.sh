#!/bin/bash -e

install -v -m 644 files/tft35a.dtbo "${ROOTFS_DIR}/boot/firmware/overlays/"

#on_chroot << EOF
#usermod -a -G tcpdump pi
#EOF

#sed -i 's/^TFTP_ADDRESS.*/TFTP_ADDRESS="0.0.0.0:69"/' "${ROOTFS_DIR}/etc/default/tftpd-hpa"
#on_chroot << EOF
#usermod -a -G tftp pi
#chown -R tftp:tftp "/srv/tftp"
#chmod 774 "/srv/tftp"
#EOF
