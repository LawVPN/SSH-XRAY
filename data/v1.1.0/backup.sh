#!/bin/bash

clear
#IP=$(wget -qO- ipinfo.io/ip);
domain=$(cat "/etc/xray/domain")
date=$(date +"%d-%m-%Y")
time=$(date +"%H-%M")

echo "Please wait, processing the backup"
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp /etc/crontab backup/
#cp -r /var/lib/alexxa-pro/ backup/alexxa-pro
cp -r /etc/xray backup/xray
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r /root/backup/${domain}_${date}_${time}.zip backup > /dev/null 2>&1
sleep 2
echo "Please wait, preparing the backup (done)"; sleep 1

#============================================

echo "Sending to current telegram chat id"; sleep 2
python3 /etc/lukman/send.py
echo "Sending to current telegram chat id (done)"

read -p "Press enter to go back" -n 1; menu-backup
