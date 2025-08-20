#!/bin/bash
## Shell to check Ubuntu OS update and if reboot is required.
## Output is JSON file in /tmp folder.
## This shell should be run via crontab on regular basis

## This value is used in Zabbix Template.
EXPORTFILE="/tmp/zabbix-os-update.json"

if [ -f $EXPORTFILE ]; then
	rm $EXPORTFILE
fi

echo -n "{\"reboot_required\":" > $EXPORTFILE
if [ -f /var/run/reboot-required ]
then
        echo -n "1," >> $EXPORTFILE
else
	echo -n "0," >> $EXPORTFILE
fi
updates=`/usr/lib/update-notifier/apt-check 2>&1 | awk -F';' '{print $1}'`
security_updates=`/usr/lib/update-notifier/apt-check 2>&1 | awk -F';' '{print $2}'`
echo -n "\"update_available\":$updates," >> $EXPORTFILE
echo -n "\"security_update_available\":$security_updates" >> $EXPORTFILE
echo -n "}" >> $EXPORTFILE
