#!/bin/bash

echo "Input your bot token: "; read token
echo "Input your telegram user/group id: "; read telid

rm /usr/bin/bkp
echo -e "#!/bin/bash
TELEGRAM_BOT_TOKEN=$token
TELEGRAM_CHAT_ID=$telid

clear
IP=$(wget -qO- ipinfo.io/ip);
date=$(date +\"%Y-%m-%d\")

clear
echo \"Mohon Menunggu, Proses Backup sedang berlangsung !!\"
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp /etc/crontab backup/
cp -r /var/lib/alexxa-pro/ backup/alexxa-pro
cp -r /etc/xray backup/xray
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1

BACKUP_FILE=/root/backup/$IP-$date.zip

if [[ \"$1\" == \"backup\" ]]; then
    if [[ -f \"$BACKUP_FILE\" ]]; then
        curl -F chat_id=\"$TELEGRAM_CHAT_ID\" -F document=@\"$BACKUP_FILE\" https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendDocument
        echo -e \"Autobackup successfull! Check your telegram message! Press /start in your bot if you didnt get the file!
        Upload your backup file to google drive if you want to restore the backup file! Cheer!\"
        echo \"Press 1 to make the autobackup runs every day (at 00.01 Jakarta time)\"
        echo \"Press 0 to ignore and just exit\"
        read \"Your choose: \"chos
        if [ \"$chos\" = 1 ]; then
            echo -e \"1 0 1 * * root bkp backup\" >> /etc/crontab
        elif [ \"$chos\" = 0 ]; then
            menu
        else
            echo \"Choose only 1 or 0!\"
            exit 1
    else
        echo \"Backup file not found.\"
    fi
else
    echo \"Invalid command. Usage: bkp backup\"
fi" > /usr/bin/bkp
chmod +x /usr/bin/bkp
