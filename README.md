# Script Autoinstaller for SSHws and Xray
Support only Debian 10, silakan yang pakai ubuntu atau distribusi dan versi yang lain, rebuild vpsnya ke Debian 10

## Installer
```
wget https://raw.githubusercontent.com/LawVPN/SSH-XRAY/main/setup.sh && chmod +x setup.sh && ./setup.sh
```

Jika sudah menggunakan Debian 10 tetapi masih mendapati error saat install script, silakan copy paste kode di bawah dan install scriptnya lagi.
```
sudo su
```
```
apt update; apt install -y vnstat htop nload; apt upgrade -y; update-grub; reboot
```

### Catatan untuk squid error atau not running
Pastikan edit banner dan buat agar tidak terlalu panjang
```
nano /etc/issue.net
```
