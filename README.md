    cd /root && wget https://raw.githubusercontent.com/emrenogay/create-cyberpanel-bulk-backups/main/get_backups.sh
    chmod +x get_backups.sh
    ./get_backups.sh

Yedekleme bittikten sonra `mkdir /root/backups` komutuyla root dizinde yedekleme dosyası oluşturulur

    mv /home/*/backup/*.tar.gz /root/backups
Komutu ile yedek dosyaları /root/backups içerisine taşınır.

    rsync -av --progress /root/backups/*.tar.gz root@your_server_ip:/destination/root/backups

Yukarıdaki komut ile hedef sunucuya yedekler gönderilir.
