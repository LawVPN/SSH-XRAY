#!/bin/bash

IPVPS=$(curl -s ipinfo.io/ip )
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )

echo "$IPVPS" > /etc/xray/ip
echo "$ISP" > /etc/xray/isp
echo "$CITY" > /etc/xray/city
