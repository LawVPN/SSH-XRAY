#!/bin/bash

apt remove speedtest -y
apt remove speedtest-cli -y
rm -f /usr/bin/speedtest

apt install curl
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash
apt install speedtest -y
