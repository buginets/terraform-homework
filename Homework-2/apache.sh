#!/bin/bash
sudo apt update
sudo apt install apache2 -y 
sudo systemctl start apache2
sudo systemctl enable apache2
sudo echo "Hello World!!!" >> /var/www/html/index.html
sudo systemctl restart apache2