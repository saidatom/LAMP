#!/bin/sh
echo $NAME
echo $ID
echo $DOMAIN
sudo apt install update -y
sudo apt install upgrade -y
sudo apt auto-remove -y

echo "\o/"

sudo apt install apache2
sudo service apache2 start

echo "\o/ \o/ \o/"

sudo apt install libapache2-mod-php libapache2-mod-php7.0 php-common php7.0 php7.0-cli php7.0-common php7.0-json php7.0-opcache
  php7.0-readline
sudo apt install git php-mysql
sudo apt install update -y
sudo apt install upgrade -y
sudo apt install mariadb-client-core-10.0
sudo apt install php7.0-curl php7.0-gd php7.0-intl php-pear php7.0-imap php7.0-mcrypt php7.0-ps php7.0-pspell php7.0-recode php7.0-snmp php7.0-tidy php7.0-xmlrpc php7.0-xsl

echo "\o/ \o/ \o/ \o/"

sudo chown ubuntu:ubuntu -R /var/www/
mkdir /var/www/$ID-$NAME

echo " \o/ \o/ \o/ \o/ \o/"
awk '{gsub("folder", "$ID-$NAME")}1' example.conf > example.tmp && mv example.tmp example_1.conf
awk '{gsub("domain", "$DOMAIN")}1' example_1.conf > example_1.tmp && mv example_1.tmp $ID-$NAME.conf
sudo a2dissite 000-default.conf
sudo a2ensite $ID-$NAME.conf

sudo mv /etc/php/7.0/apache2/php.ini /etc/php/7.0/apache2/php_backup.ini
sudo mv ~/install_LAMP/php.ini /etc/php/7.0/apache2/php.ini

sudo service apache2 restart
