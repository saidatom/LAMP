#!/bin/sh
echo $NAME
echo $ID
echo $DOMAIN
sudo apt update -y
sudo apt upgrade -y
sudo apt auto-remove -y

sudo apt install apache2
sudo service apache2 start

sudo apt install libapache2-mod-php libapache2-mod-php7.0 php-common php7.0 php7.0-cli php7.0-common php7.0-json php7.0-opcache php7.0-readline -y
sudo apt install git php-mysql -y
sudo apt update -y
sudo apt upgrade -y
sudo apt install php7.0-curl php7.0-gd php7.0-intl php-pear php7.0-imap php7.0-mcrypt php7.0-ps php7.0-pspell php7.0-recode php7.0-snmp php7.0-tidy php7.0-xmlrpc php7.0-xsl -y
sudo apt install mariadb-client-core-10.0 php7.0-zip php7.0-mbstring -y

sudo chown ubuntu:ubuntu -R /var/www/
mkdir /var/www/$ID-$NAME

echo "Create vHost"
awk '{gsub("folder", "'$ID'-'$NAME'")}1' example.conf > example.tmp && mv example.tmp example_1.conf
awk '{gsub("domain", "'$DOMAIN'")}1' example_1.conf > example_1.tmp && mv example_1.tmp $ID-$NAME.conf
sudo mv ~/install_LAMP/$ID-$NAME.conf /etc/apache2/sites-available/$ID-$NAME.conf
sudo a2enmod rewrite
sudo a2dissite 000-default.conf
sudo a2ensite $ID-$NAME.conf

sudo mv /etc/php/7.0/apache2/php.ini /etc/php/7.0/apache2/php_backup.ini
sudo mv ~/install_LAMP/php.ini /etc/php/7.0/apache2/php.ini

sudo service apache2 restart

echo "Install Composer/Drush"
curl -sS https://getcomposer.org/installer | php
sudo mv ~/install_LAMP/composer.phar /usr/local/bin/composer
echo 'export PATH="$HOME/.config/composer/vendor/bin:$PATH"' >> ~/.bashrc
source ~/.bash_profile
composer global require drush/drush:8.1.15

echo "Install Gulp"
sudo apt-get install nodejs
sudo apt-get install npm
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install --global gulp-cli

echo "\o/"
echo "\o/ \o/"
echo "\o/ \o/ \o/"
echo "\o/ \o/ \o/ \o/"
echo " \o/ \o/ \o/ \o/ \o/"
