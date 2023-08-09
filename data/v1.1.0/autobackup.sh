#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/yudhynetwork/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
GREEN="\033[0;32m" 
COLOR1="$(cat /etc/yudhynetwork/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/yudhynetwork/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"  
WH='\033[1;37m'

#================================================
if grep -q "backup" /etc/crontab; then
  status="ON"
else
  status="OFF"
fi

if [[ $status == "ON" ]]; then
  status2="${WH}[${COLOR1}ON${WH}]${NC}"
elif [[ $status == "OFF" ]]; then
  status2="${WH}[${RED}OFF${WH}]${NC}"
else
  status2="${RED}Enn.. Error${NC}"
fi
#===============================================

fcminute() {
sed -i '/backup/d' /etc/crontab
sed -i '$a\*/10 * * * * root backup' /etc/crontab
echo "Backup goes every 10 minutes"
echo ""
#read -p "Press enter to go back" -n 1; autobackup
autobackup
}

fchour() {
sed -i '/backup/d' /etc/crontab
sed -i '$a\0 * * * * root backup' /etc/crontab
echo "Backup goes every hour"
echo ""
#read -p "Press enter to go back" -n 1; autobackup
autobackup
}

fcday() {
sed -i '/backup/d' /etc/crontab
sed -i '$a\1 0 * * * root backup' /etc/crontab
echo "Backup goes every 00.01 Jakarta time"
echo ""
#read -p "Press enter to go back" -n 1; autobackup
autobackup
}

fcweek() {
sed -i '/backup/d' /etc/crontab
sed -i '$a\1 0 * * 0 root backup' /etc/crontab
echo "Backup goes every sunday at 00.01 Jakarta time"
echo ""
#read -p "Press enter to go back" -n 1; autobackup
autobackup
}

infos() {
echo "Deleting existing cronjob"
sudo sed -i '/backup/d' /etc/crontab
echo "Deleting existing cronjob (done)"
echo ""; autobackup
#read -p "Press enter to go back" -n 1; autobackup
}

#=======================================================
# Baca isi dari /etc/crontab
crontab_content=$(cat /etc/crontab)

# Evaluasi isi crontab dan tentukan nilai status3
if [[ $crontab_content == *"*/10 * * * * root backup"* ]]; then
     status3="${WH}[${COLOR1}01${WH}]${NC}"
elif [[ $crontab_content == *"0 * * * * root backup"* ]]; then
     status3="${WH}[${COLOR1}02${WH}]${NC}"
elif [[ $crontab_content == *"1 0 * * * root backup"* ]]; then
     status3="${WH}[${COLOR1}03${WH}]${NC}"
elif [[ $crontab_content == *"1 0 * * 0 root backup"* ]]; then
     status3="${WH}[${COLOR1}04${WH}]${NC}"
fi
#=======================================================


clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}              ${WH}• AUTOBACKUP MENU •             ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}EVERY 10 MINUTES ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}EVERY DAY $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}EVERY HOUR       ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}EVERY WEEK    $COLOR1 $NC"
echo -e " $COLOR1 $NC                                               $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}AUTOBACKUP STATUS $status2 $status3"
echo -e " $COLOR1 $NC                                               $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}00${WH}]${NC} ${COLOR1}• ${WH}GO BACK${NC}"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                 ${WH}• LawNetwork •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"

echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; fcminute ;;
02 | 2) clear ; fchour ;;
03 | 3) clear ; fcday ;;
04 | 4) clear ; fcweek ;;
05 | 5) clear ; infos ;;
00 | 0) clear ; menu-backup ;;
*) clear ; menu-backup ;;
esac
