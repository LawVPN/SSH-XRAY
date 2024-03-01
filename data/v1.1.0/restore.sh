#!/bin/bash
clear

echo -n "Restore from gdrive link? [y/N]: "
read response

if [ "$response" == "y" ] || [ "$response" == "Y" ]; then
    echo "Please make sure you have the link from google drive"
    echo "and give access to \"anyone with the link\""
    echo -ne "Link: "; read link
    full_link="$link"
    
    # Menggunakan 'sed' untuk mengekstrak ID dari URL
    id=$(echo "$full_link" | sed -n 's/.*\/d\/\([^\/]*\)\/.*/\1/p')
    echo "Extracted ID: $id"

    newlink="https://drive.google.com/u/4/uc?id=${id}&export=download"
    cd
    wget -q -O backup.zip "$newlink"
elif [ "$response" == "n" ] || [ "$response" == "N" ]; then
    # Jika user memilih "n" atau "N", langsung lanjut ke line berikutnya
    echo "Skipping restore from gdrive."
    echo "Make sure your backup is right here /root/backup.zip"
    cd
else
    # Jika input tidak valid, kembali ke script sebelumnya
    echo "Invalid input. Going back."
    exit 1
fi



################echo Start Restore
unzip backup.zip
rm -f backup.zip
################################
sleep 1
cd /root/backup
cp passwd /etc/
cp group /etc/
cp shadow /etc/
cp gshadow /etc/
#cp -r alexxa-pro /var/lib/
cp -r xray /etc/
cp -r public_html /home/vps/
cp crontab /etc/
rm -rf /root/backup
rm -f backup.zip
echo Done

echo "Note: You need to restart all services (go to settings) to take effect"; sleep 5
