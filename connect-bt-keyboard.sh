#copy this script under /etc/init.d (debian) and below lines to /etc/rc.local right above exit
#service bluetooth start
#hciconfig hci0 up
#/etc/init.d/connect-bt-keyboard.sh &


#!/bin/bash

address="20:73:0A:B0:01:E1"

while (sleep 1)
do
	connected=$(hidd --show) > /dev/null
	if [[ ! $connected =~ .*${address}.* ]] ; then
		bluez-test-input connect ${address} > /dev/null 2>&1
	fi
done

