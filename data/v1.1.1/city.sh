#!/bin/bash

IPVPS=$(curl -s ipinfo.io/ip )
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )

mkdir -p /etc/lukman
echo "$IPVPS" > /etc/lukman/ip
echo "$ISP" > /etc/lukman/isp
echo "$CITY" > /etc/lukman/city
