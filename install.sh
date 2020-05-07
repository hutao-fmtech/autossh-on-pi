#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root"
    echo "please use: sudo ./install.sh"
	exit 1
fi

cp -v autosshd.sh /usr/local/bin/autosshd.sh
chmod +x /usr/local/bin/autosshd.sh

cp -v autosshd.service /usr/lib/systemd/system/

systemctl enable autosshd
systemctl start autosshd

echo "autosshd service installed success"
exit 0
