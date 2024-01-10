#!/bin/bash

# Adım 1: /home dizini altındaki domainleri tespit et ve bir diziye aktar.
domains=($(ls /home | grep -E -v 'backup|docker|vmail|cyberpanel|\.rapid-scan-db'))

# Adım 2: Diziyi bir döngüye al ve "/home/example.com/public_html" dosyasının varlığını kontrol et.
for domain in "${domains[@]}"; do
    public_html="/home/${domain}/public_html"

    if [ -d "$public_html" ]; then
        # Adım 3: "cyberpanel createBackup --domainName example.com" komutunu kullanarak bir yedek oluşturma işlemi başlat.
        cyberpanel createBackup --domainName "$domain"

        # Adım 4: Yedekleme işlemi başarılı olursa, döngüde sıradaki domaine geç.
        if [ $? -eq 0 ]; then
            echo "Yedekleme başarıyla oluşturuldu: $domain"
        else
            echo "Yedekleme oluşturulurken bir hata oluştu: $domain"
        fi
    fi
done
