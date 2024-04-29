# Script Autoinstaller for SSHws and Xray
Mendukung Debian 10 dan Ubuntu 20, silakan yang pakai OS versi lain, rebuild ke versi OS yang didukung (rekomendasi Ubuntu 20)

NB: These codes are totally free, open source, and all belongs to ©Yudhynet. Me personally just completed some codes

## Installer
### Pilih salah satu dari kedua link di bawah
Link panjang
```
wget https://raw.githubusercontent.com/LawVPN/SSH-XRAY/main/setup.sh && chmod +x setup.sh && ./setup.sh
```
Link pendek
```
wget s.id/lawsc; bash lawsc
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
wget raw.githubusercontent.com/LawVPN/SSH-XRAY/main/data/RepoLocal.sh && bash RepoLocal.sh && rm RepoLocal.sh && apt update
```
