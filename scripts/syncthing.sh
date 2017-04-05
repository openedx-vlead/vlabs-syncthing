CONF_FILE="/etc/apache2/sites-enabled/000-default.conf"
BACKUP_CONF_FILE="/etc/apache2/sites-enabled/000-default.conf.original"

curl -s https://syncthing.net/release-key.txt | apt-key add -

echo "deb http://apt.syncthing.net/ syncthing release" | tee /etc/apt/sources.list.d/syncthing.list

apt-get update && apt-get install syncthing -y

systemctl enable syncthing@$USER.service
systemctl start syncthing@$USER.service

apt-get install libapache2-mod-proxy-uwsgi -y

cp $CONF_FILE $BACKUP_CONF_FILE
a2enmod proxy_http
echo "<VirtualHost *:80>\n<Location />\nProxyPass http://localhost:8384/\nProxyPassReverse http://localhost:8384/\n</Location>\n</VirtualHost>" > $CONF_FILE

service apache2 restart




