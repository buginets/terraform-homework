#!/bin/bash

sudo apt update
sudo apt install -y apache2 \
                 ghostscript \
                 libapache2-mod-php \
                 mysql-server \
                 php \
                 php-bcmath \
                 php-curl \
                 php-imagick \
                 php-intl \
                 php-json \
                 php-mbstring \
                 php-mysql \
                 php-xml \
                 php-zip

sudo systemctl start apache2
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
sudo rm -rf /var/www/html/*
sudo mv wordpress/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
sudo systemctl restart apache2
sudo systemctl enable apache2
                 