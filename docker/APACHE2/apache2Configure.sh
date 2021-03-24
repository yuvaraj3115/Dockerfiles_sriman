#!/bin/bash
set -e
siteName=$1
isApache2Installed=0
function checkApache2Installed() {
    if [ -e "/etc/apache2" ]
    then
        isApache2Installed=1
    fi
}
function configureSite() {
    echo ${siteName}
    if [ -e "/etc/apache2/sites-available/${siteName}.conf" ]
    then
        echo "site already exists"
    else
        cd /etc/apache2/sites-available
        touch "${siteName}.conf"
        echo -e "<VirtualHost *:80> \n ServerAdmin webmaster@localhost \n ServerName localhost \n DocumentRoot /var/www/${siteName} \n </VirtualHost>" >> ${siteName}.conf
        a2ensite ${siteName}
    fi
}
function startApache2() {
    service apache2 start
}

checkApache2Installed
if [ $isApache2Installed -eq 1 ] 
then
    configureSite
    startApache2
fi
while true
do
	#echo "Press [CTRL+C] to stop.."
	sleep 1000
done