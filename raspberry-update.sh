#!/bin/bash
echo "starting rpi update!"
sudo apt-get update && sudo apt-get dist-upgrade -y
sendemail -l email.log -f "$FROMEMAIL" -u "pi syslog $TIMESTAMP" -t "$TOEMAIL" -s "smtp.gmail.com:587" -o tls=yes -xu "$FROMEMAIL" -xp "$EMAILPASSWORD" -o message-file="/var/log/syslog"
sudo apt-get autoremove
sudo apt-get autoclean
echo "finished rpi update!"
