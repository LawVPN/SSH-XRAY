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
### For anyone whos using ISP RUMAHWEB Indonesia or FCCDCI server
If you encounter when installing the script is taking time so long, change the repository to local one (Data Utama Surabaya, Indonesia), copy and paste this code then run the Installer again
```
wget raw.githubusercontent.com/LawVPN/SSH-XRAY/main//RepoLocal.sh && bash RepoLocal.sh && rm RepoLocal.sh && apt update
```
