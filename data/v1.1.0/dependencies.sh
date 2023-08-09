#!/bin/bash

apt update; apt upgrade -y
apt install -y python3 python3-pip
pip3 install python-telegram-bot

rm -rf /etc/lukman/send.py
cat > /etc/lukman/send.py << EOF
import os
import glob
import asyncio
import telegram
from telegram.ext import Updater

async def get_token_and_chat_id():
    with open('/etc/lukman/bot_token', 'r') as f_token, open('/etc/lukman/chat_id', 'r') as f_chat_id:
        token = f_token.read().strip()
        chat_id = f_chat_id.read().strip()
    return token, chat_id

async def send_backup_to_telegram(token, chat_id):
    bot = telegram.Bot(token=token)

    backup_files = glob.glob('/root/backup/*.zip')
    if not backup_files:
        print("No backup files found.")
        return

    for file_path in backup_files:
        with open(file_path, 'rb') as f:
            try:
                await bot.send_document(chat_id=chat_id, document=f)
                print(f"Backup {file_path} sent successfully.")
            except Exception as e:
                print(f"Failed to send backup {file_path}. Error: {e}")

async def main():
    bot_token, chat_id = await get_token_and_chat_id()
    await send_backup_to_telegram(bot_token, chat_id)

if __name__ == "__main__":
    asyncio.run(main())
EOF
echo ""
echo "All finished"; sleep 2
echo "Redirecting.."; sleep 2; menu
