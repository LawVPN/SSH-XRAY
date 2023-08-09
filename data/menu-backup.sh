#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/yudhynetwork/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m" 
COLOR1="$(cat /etc/yudhynetwork/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/yudhynetwork/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"  
WH='\033[1;37m'                  
###########- LawNET -##########

infos() {
echo -e "
====================================================================================
Because owners of this script lack of email account, we changing the backup method.
So basically it is not hard to do, just follow the things up:
====================================================================================
1. Create a telegram bot from @BotFather
2. Follow the step it provides, like give it a name and username for your bot
3. It should gives you a bot token, so save it
4. Now go to @MissRose_bot and type /id, she will inform you your ID, save it
5. (optional) If you wanna make your new bot runs in your group chat, type /id in
   your group chat and make sure @MissRose_bot is there.
6. Now you have both bot token and chat id
7. So lets just store them to your backup configuration. Go back to the backup menu
   and choose BACKUP SETTINGS
8. Input your bot token and chat id
9. Done! Now you can do backup to test if the script is working well
====================================================================================
How to restore:
1. After you did setting the backup configuration up, and your bot works well,
   upload your latest backup file to google drive and copy the link
2. Go back to the backup menu and choose RESTORE
3. Paste the backup link from google drive
4. Done!
====================================================================================
Chat me at telegram @Law_Sky if you encounter any errors
Thank you for using this script
===================================================================================="
echo ""
read -p "Press enter to go back" -n 1; menu-backup
}


clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}             ${WH}• BACKUP PANEL MENU •             ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}AUTO BACKUP      ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}RESTORE    $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}BACKUP           ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}BACKUP SETTINGS    $COLOR1 $NC"
echo -e " $COLOR1 $NC                                               $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}TUTORIAL ON HOW TO USE"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}06${WH}]${NC} ${COLOR1}• ${WH}INSTALL DEPENDENCIES"
echo -e " $COLOR1 $NC                                               $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}00${WH}]${NC} ${COLOR1}• ${WH}GO BACK${NC}                              $COLOR1 $NC"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                 ${WH}• LawNetwork •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; autobackup ;;
02 | 2) clear ; backup ;;
03 | 3) clear ; restore ;;
04 | 4) clear ; backup_setting ;;
05 | 5) clear ; infos ;;
06 | 6) clear ; bash /etc/lukman/dependencies.sh ; menu-backup ;;
00 | 0) clear ; menu ;;
*) clear ; menu-backup ;;
esac
