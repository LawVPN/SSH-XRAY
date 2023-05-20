#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/yudhynetwork/theme/color.conf)
NC="\e[0m"
export GREEN='\033[0;32m';
RED="\033[0;31m" 
COLOR1="$(cat /etc/yudhynetwork/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/yudhynetwork/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"  
WH='\033[1;37m'                  
###########- END COLOR CODE -##########

ipes=$(curl -sS ipv4.icanhazip.com)
[[ ! -f /usr/bin/jq ]] && {
    red "Mengunduh file jq!"
    wget -q --no-check-certificate "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64" -O /usr/bin/jq
    chmod +x usr/bin/jq
}

dircreate() {
    [[ ! -d /root/multi ]] && mkdir -p /root/multi && touch /root/multi/voucher && touch /root/multi/claimed && touch /root/multi/reseller && touch /root/multi/public && touch /root/multi/hist && echo "off" >/root/multi/public
    [[ ! -d /etc/.maAsiss ]] && mkdir -p /etc/.maAsiss
}

x="ok"

function botonoff(){
clear
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$COLBG1                  • BOT PANEL •                   $NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
dircreate
[[ ! -f /root/multi/bot.conf ]] && {
echo -e "
• Status ${GREEN}Installer${NC} And ${GREEN}Running!${NC}
"
[[ ! -f /root/ResBotAuth ]] && {
echo -ne " API TOKEN : "
read bot_tkn
echo "Toket: $bot_tkn" >/root/ResBotAuth
echo -ne " ID ADMIN  : "
read adm_ids
echo "Admin_ID: $adm_ids" >>/root/ResBotAuth
}
echo -ne " NAMA BOT : "
read bot_user
[[ -z $bot_user ]] && bot_user="Yudhy_Bot"
echo ""
echo -ne " LIMIT     : "
read limit_pnl
[[ -z $limit_pnl ]] && limit_pnl="1"
echo ""
cat <<-EOF >/root/multi/bot.conf
Botname: $bot_user
Limit: $limit_pnl
EOF

fun_bot1() {
clear
[[ ! -e "/etc/.maAsiss/.Shellbtsss" ]] && {
wget -qO- https://raw.githubusercontent.com/LawVPN/SSH-XRAY/main/data/BotAPI.sh >/etc/.maAsiss/.Shellbtsss
}
[[ "$(grep -wc "sam_bot" "/etc/rc.local")" = '0' ]] && {
sed -i '$ i\screen -dmS sam_bot bbt' /etc/rc.local >/dev/null 2>&1
}
}
screen -dmS sam_bot bbt >/dev/null 2>&1
fun_bot1
[[ $(ps x | grep "sam_bot" | grep -v grep | wc -l) != '0' ]] && {
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$COLBG1                  • BOT PANEL •                   $NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e ""
echo -e " [INFO]  Bot successfully activated !" 
echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e ""
read -n 1 -s -r -p " Press any key to back on menu"
menu-bot
} || {
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$COLBG1                  • BOT PANEL •                   $NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e ""
echo -e " [INFO] Information not valid !"
echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e ""
read -n 1 -s -r -p " Tekan tombol apa saja untuk kembali ke menu"
menu-bot
}
} || {
clear
fun_bot2() {
screen -r -S "sam_bot" -X quit >/dev/null 2>&1
[[ $(grep -wc "sam_bot" /etc/rc.local) != '0' ]] && {
sed -i '/sam_bot/d' /etc/rc.local
}
rm -f /root/multi/bot.conf
sleep 1
}
fun_bot2
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$COLBG1                  • BOT PANEL •                   $NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e ""
echo -e " [INFO] Bot Stoped Successfully"
echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e ""
read -n 1 -s -r -p " Tekan tombol apa saja untuk kembali ke menu"
menu-bot
}
}
clear
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$COLBG1                  • BOT PANEL •                   $NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e ""
echo -e " $COLOR1 [01]$NC • Start & Stop Bot"
echo -e ""
echo -e " $COLOR1 [00]$NC • Back To Main Menu"
echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; botonoff ;;
02 | 2) clear ; menu2 ;;
03 | 3) clear ; menu3 ;;
00 | 0) clear ; menu ;;
*) clear ; menu-bot ;;
esac