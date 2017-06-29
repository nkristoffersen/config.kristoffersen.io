#!/bin/bash
echo "starting rpi update!"
sudo apt-get update && sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y
echo $FROMEMAIL
echo $PISERIAL
echo $TIMESTAMP
echo $TOEMAIL
echo $EMAILPASSWORD
sudo sendemail -l email.log -f "$FROMEMAIL" -u "$PISERIAL syslog $TIMESTAMP" -t "$TOEMAIL" -s "smtp.gmail.com:587" -o tls=yes -xu "$FROMEMAIL" -xp "$EMAILPASSWORD" -m "see attached" -a "/var/log/syslog"
sudo sendemail -l email.log -f "$FROMEMAIL" -u "$PISERIAL wavelog $TIMESTAMP" -t "$TOEMAIL" -s "smtp.gmail.com:587" -o tls=yes -xu "$FROMEMAIL" -xp "$EMAILPASSWORD" -m "see attached" -a "/var/log/wave.log"
echo "finished rpi update!"
