#!/bin/bash

mkdir -p /etc/lukman

bckup() {
clear
echo "================================================"
echo "                 BACKUP SETTING                 "
echo "================================================"
echo -ne "Input your Bot Token: "; read bot_token
echo -ne "Input your Chat ID: "; read chat_id
echo "================================================"

echo -n "$bot_token" > /etc/lukman/bot_token 
echo -n "$chat_id" > /etc/lukman/chat_id
echo "Done!"
read -p "Press enter to go back" -n 1; menu-backup
}

clear
echo "================================================"
echo "                 BACKUP SETTING                 "
echo "================================================"
path="/etc/lukman/bot_token"
if [ -e "$path" ]; then
   echo "You already set the backup setting up!"
   echo -ne "Want to change the information instead? [Y/n]: "; read confirm
   if [[ "$confirm" = [Yy] ]]; then
      bckup
   else
      menu-backup
   fi
else
   bckup
fi
