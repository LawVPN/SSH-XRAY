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
###########- Yudhy Network -##########
function status(){
clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
rekk='xray'
becek='XRAY'
else
rekk='v2ray'
becek='V2RAY'
fi

ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${WH}ONLINE${NC}"
else
ressh="${red}OFFLINE${NC}"
fi
sshstunel=$(service stunnel4 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${WH}ONLINE${NC}"
else
resst="${red}OFFLINE${NC}"
fi
sshws=$(service ws-dropbear status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
rews="${WH}ONLINE${NC}"
else
rews="${red}OFFLINE${NC}"
fi

sshws2=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws2" = "active" ]; then
rews2="${WH}ONLINE${NC}"
else
rews2="${red}OFFLINE${NC}"
fi

db=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$db" = "active" ]; then
resdb="${WH}ONLINE${NC}"
else
resdb="${red}OFFLINE${NC}"
fi
 
v2r=$(service $rekk status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${WH}ONLINE${NC}"
else
resv2r="${red}OFFLINE${NC}"
fi
vles=$(service $rekk status | grep active | cut -d ' ' $stat)
if [ "$vles" = "active" ]; then
resvles="${WH}ONLINE${NC}"
else
resvles="${red}OFFLINE${NC}"
fi
trj=$(service $rekk status | grep active | cut -d ' ' $stat)
if [ "$trj" = "active" ]; then
restr="${WH}ONLINE${NC}"
else
restr="${red}OFFLINE${NC}"
fi

tcp="$(systemctl show --now openvpn-server@server-tcp-1194 --no-page)"
status1=$(echo "${tcp}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status1}" = "active" ]; then
ovpntcp="${WH}ONLINE${NC}"
else
ovpntcp="${red}OFFLINE${NC}"
fi

udp="$(systemctl show --now openvpn-server@server-udp-2200 --no-page)"
status2=$(echo "${udp}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status2}" = "active" ]; then
ovpnudp="${WH}ONLINE${NC}"
else
ovpnudp="${red}OFFLINE${NC}"
fi

ovhp="$(systemctl show ohp.service --no-page)"
status3=$(echo "${ovhp}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status3}" = "active" ]; then
ohp="${WH}ONLINE${NC}"
else
ohp="${red}OFFLINE${NC}"
fi

ningx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ningx" = "active" ]; then
resnx="${WH}ONLINE${NC}"
else
resnx="${red}OFFLINE${NC}"
fi

squid=$(service squid status | grep active | cut -d ' ' $stat)
if [ "$squid" = "active" ]; then
ressq="${WH}ONLINE${NC}"
else
ressq="${red}OFFLINE${NC}"
fi
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• SERVER STATUS •               ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1 ${NC}  ${COLOR1}• ${WH}SSH & VPN                        ${COLOR1}• $ressh"
echo -e " $COLOR1 ${NC}  ${COLOR1}• ${WH}OVPN TCP                         ${COLOR1}• $ovpntcp"
echo -e " $COLOR1 ${NC}  ${COLOR1}• ${WH}OVPN UDP                         ${COLOR1}• $ovpnudp"
echo -e " $COLOR1 ${NC}  ${COLOR1}• ${WH}OVPN OHP                         ${COLOR1}• $ohp"
echo -e " $COLOR1 ${NC}  ${COLOR1}• ${WH}SQUID                            ${COLOR1}• $ressq"
echo -e " $COLOR1 ${NC}  ${COLOR1}• ${WH}DROPBEAR                         ${COLOR1}• $resdb"
echo -e " $COLOR1 ${NC}  ${COLOR1}• ${WH}NGINX                            ${COLOR1}• $resnx"
echo -e " $COLOR1 ${NC}  ${COLOR1}• ${WH}WS DROPBEAR                      ${COLOR1}• $rews"
echo -e " $COLOR1 ${NC}  ${COLOR1}• ${WH}WS STUNNEL                       ${COLOR1}• $rews2"
echo -e " $COLOR1 ${NC}  ${COLOR1}• ${WH}STUNNEL                          ${COLOR1}• $resst"
echo -e " $COLOR1 ${NC}  ${COLOR1}• ${WH}XRAY-SS                          ${COLOR1}• $resv2r"
echo -e " $COLOR1 ${NC}  ${COLOR1}• ${WH}XRAY                             ${COLOR1}• $resv2r"
echo -e " $COLOR1 ${NC}  ${COLOR1}• ${WH}VLESS                            ${COLOR1}• $resvles"
echo -e " $COLOR1 ${NC}  ${COLOR1}• ${WH}TROJAN                           ${COLOR1}• $restr"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                 ${WH}• LawNetwork •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu-set
}
function restart(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• SERVER STATUS •               ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
systemctl daemon-reload
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Starting ...                        $COLOR1 ${NC}"
sleep 1
systemctl restart ssh
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting SSH Services             $COLOR1 ${NC}"
sleep 1
systemctl restart squid
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting Squid Services           $COLOR1 ${NC}"
sleep 1
systemctl restart openvpn
systemctl restart --now openvpn-server@server-tcp-1194
systemctl restart --now openvpn-server@server-udp-2200
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting OpenVPN Services         $COLOR1 ${NC}"
sleep 1
systemctl restart nginx
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting Nginx Services           $COLOR1 ${NC}"
sleep 1
systemctl restart dropbear
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting Dropbear Services        $COLOR1 ${NC}"
sleep 1
systemctl restart ws-dropbear
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting Ws-Dropbear Services     $COLOR1 ${NC}"
sleep 1
systemctl restart ws-stunnel
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting Ws-Stunnel Services      $COLOR1 ${NC}"
sleep 1
systemctl restart stunnel4
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting Stunnel4 Services        $COLOR1 ${NC}"
sleep 1
systemctl restart xray
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting Xray Services            $COLOR1 ${NC}"
sleep 1
systemctl restart cron
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}Restarting Cron Services            $COLOR1 ${NC}"
echo -e " $COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}] ${COLOR1}• ${WH}All Services Restates Successfully  $COLOR1 ${NC}"
sleep 1
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                 ${WH}• LawNetwork •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu-set
}

[[ -f /etc/ontorrent ]] && sts="\033[0;32mON \033[0m" || sts="\033[1;31mOFF\033[0m"

enabletorrent() {
[[ ! -f /etc/ontorrent ]] && {
sudo iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
sudo iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
sudo iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
sudo iptables-save > /etc/iptables.up.rules
sudo iptables-restore -t < /etc/iptables.up.rules
sudo netfilter-persistent save >/dev/null 2>&1  
sudo netfilter-persistent reload >/dev/null 2>&1 
touch /etc/ontorrent
menu-set
} || {
sudo iptables -D FORWARD -m string --string "get_peers" --algo bm -j DROP
sudo iptables -D FORWARD -m string --string "announce_peer" --algo bm -j DROP
sudo iptables -D FORWARD -m string --string "find_node" --algo bm -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "BitTorrent" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "peer_id=" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string ".torrent" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "torrent" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "announce" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "info_hash" -j DROP
sudo iptables-save > /etc/iptables.up.rules
sudo iptables-restore -t < /etc/iptables.up.rules
sudo netfilter-persistent save >/dev/null 2>&1
sudo netfilter-persistent reload >/dev/null 2>&1 
rm -f /etc/ontorrent
menu-set
}
}

clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1  $NC$COLBG1               ${WH}• VPS SETTING •                 $COLOR1  $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}RUNNING           ${WH}[${COLOR1}06${WH}]${NC} ${COLOR1}• ${WH}RESTART ALL"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}SET BANNER        ${WH}[${COLOR1}07${WH}]${NC} ${COLOR1}• ${WH}AUTO REBOOT"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}BANDWITH USAGE    ${WH}[${COLOR1}08${WH}]${NC} ${COLOR1}• ${WH}SPEEDTEST"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}ANTI TORRENT${NC} $sts  ${WH}[${COLOR1}09${WH}]${NC} ${COLOR1}• ${WH}HIDESSH"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}TCP TWEAK         ${WH}[${COLOR1}10${WH}]${NC} ${COLOR1}• ${WH}REGION CHECKER"
echo -e " $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}00${WH}]${NC} ${COLOR1}• ${WH}GO BACK$NC"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                 ${WH}• LawNetwork •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; status ;;
02 | 2) clear ; nano /etc/issue.net ;;
03 | 3) clear ; mbandwith ;;
04 | 4) clear ; enabletorrent ;;
05 | 5) clear ; menu-tcp ;;
06 | 6) clear ; restart ;;
07 | 7) clear ; autoboot ;;
08 | 8) clear ; mspeed ;;
09 | 9) clear ; hidessh ;;
10) clear ; regionchecker ;;
00 | 0) clear ; menu ;;
*) clear ; menu-set ;;
esac
