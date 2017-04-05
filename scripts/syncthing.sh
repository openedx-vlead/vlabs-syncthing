
#export http_proxy="http://proxy.iiit.ac.in:8080"
#export https_proxy="http://proxy.iiit.ac.in:8080"

curl -s https://syncthing.net/release-key.txt | apt-key add -

echo "deb http://apt.syncthing.net/ syncthing release" | tee /etc/apt/sources.list.d/syncthing.list

apt-get update && apt-get install syncthing -y

systemctl enable syncthing@$USER.service
systemctl start syncthing@$USER.service

apt-get install libapache2-mod-proxy-uwsgi -y

echo "NameVirtualHost *:80" >> /etc/apache2/sites-enabled/000-default.conf
echo "<VirtualHost *:80>\nServerName sync.vlabs.ac.in\n<Location />\nProxyPass http://localhost:8384/\nProxyPassReverse http://localhost:8384/\n</Location>\n</VirtualHost>" >> /etc/apache2/sites-enabled/000-default.conf
a2enmod proxy_http
service apache2 restart




