#!/bin/bash

echo "Input your bot token: "; read token
echo "Input your telegram user/group id: "; read telid

echo -e "#!/bin/bash
TELEGRAM_BOT_TOKEN="$token"
TELEGRAM_CHAT_ID="$telid"
BACKUP_FILE="/root/backup/backup.txt"

if [[ "$1" == "backup" ]]; then
    if [[ -f "$BACKUP_FILE" ]]; then
        curl -F chat_id="$TELEGRAM_CHAT_ID" -F document=@"$BACKUP_FILE" https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendDocument
    else
        echo "Backup file not found."
    fi
else
    echo "Invalid command. Usage: ./backup.sh backup"
fi" > /usr/bin/bkp
