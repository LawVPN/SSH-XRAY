#!/bin/bash

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )

echo "$ISP" > /etc/lukman/isp
echo "$CITY" > /etc/lukman/city
