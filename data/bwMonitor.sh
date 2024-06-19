#!/bin/bash

wget -q -O /usr/bin/bwMonitor raw.githubusercontent.com/LawVPN/SSH-XRAY/main/data/bwMonitor  && chmod +x /usr/bin/bwMonitor

cat <<EOF > "/etc/cron.d/bwMonitor"
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 */6 * * * root bwMonitor
EOF

rm bwMonitor.sh
rm bwMonitor
