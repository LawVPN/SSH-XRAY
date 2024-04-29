#!/bin/bash

os=$(lsb_release -si)
version=$(lsb_release -sr)

if [ "$os" = "Debian" ] && [ "$version" = "10" ]; then
echo -e "deb http://kartolo.sby.datautama.net.id/debian/ buster main contrib non-free\n\
deb http://kartolo.sby.datautama.net.id/debian/ buster-updates main contrib non-free\n\
deb http://kartolo.sby.datautama.net.id/debian-security/ buster/updates main contrib non-free" > /etc/apt/sources.list
echo "Repositories for Debian 10 have been added."
elif [ "$os" = "Ubuntu" ] && [ "$version" = "20.04" ]; then
echo -e "deb http://kartolo.sby.datautama.net.id/ubuntu/ focal main restricted universe multiverse\n\
deb http://kartolo.sby.datautama.net.id/ubuntu/ focal-updates main restricted universe multiverse\n\
deb http://kartolo.sby.datautama.net.id/ubuntu/ focal-security main restricted universe multiverse\n\
deb http://kartolo.sby.datautama.net.id/ubuntu/ focal-backports main restricted universe multiverse\n\
deb http://kartolo.sby.datautama.net.id/ubuntu/ focal-proposed main restricted universe multiverse" > /etc/apt/sources.list
echo "Repositories for Ubuntu 20.04 have been added."
else
echo ""
echo "[ Warning ] This OS $os $version is not supported, contact t.me/Law_sky for more info."
fi
