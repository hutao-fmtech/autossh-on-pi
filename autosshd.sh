#!/bin/bash

device_id=$(cat /etc/ble-ap/bytedance-ap.conf | grep devicename | awk -F "BDAFM" '{print $2}')
port_offs=$((16#$device_id))

let "local_port=port_offs+10000"
let "remote_port=port_offs+20000"

echo $local_port
echo $remote_port

killall autossh

/bin/su -c "/usr/bin/autossh -M $local_port -o "ExitOnForwardFailure=yes" -NR $remote_port:localhost:22 root@111.231.221.20" - pi

exit 0
