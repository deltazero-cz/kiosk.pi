#!/bin/bash -e

. "${BASE_DIR}/config"
on_chroot << EOF
echo "${FIRST_USER_NAME}:$(echo "${FIRST_USER_PASS}" | openssl passwd -6 -stdin)" > /boot/userconf.txt
echo "${KIOSK_URL}" > /boot/kiosk.url
chown 1000:1000 /boot/kiosk.url

echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
export DEBIAN_FRONTEND=noninteractive
EOF

install -m 644 files/config.txt "${ROOTFS_DIR}/boot/"
install -m 644 files/cmdline.txt "${ROOTFS_DIR}/boot/"

HOME="${ROOTFS_DIR}/home/${FIRST_USER_NAME}"
install -m 755 -o 1000 -g 1000 files/kiosk.sh "${HOME}/"
install -m 644 -o 1000 -g 1000 files/.profile "${HOME}/"
install -m 644 -o 1000 -g 1000 files/.xinitrc "${HOME}/"
install -m 644 -o 1000 -g 1000 files/.hushlogin "${HOME}/"
install -m 755 -o 1000 -g 1000 files/splash.png "${HOME}/"
install -m 755 -o 1000 -g 1000 -d "${HOME}/bin/"
install -m 755 -o 1000 -g 1000 files/bin/browser "${HOME}/bin/"
install -m 755 -o 1000 -g 1000 files/bin/cec2kbd "${HOME}/bin/"
