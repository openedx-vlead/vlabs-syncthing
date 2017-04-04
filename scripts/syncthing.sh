

curl -s https://syncthing.net/release-key.txt | sudo apt-key add -

echo "deb http://apt.syncthing.net/ syncthing release" | sudo tee /etc/apt/sources.list.d/syncthing.list

sudo apt-get update && sudo apt-get install syncthing

sudo systemctl enable syncthing@$USER.service
sudo systemctl start syncthing@$USER.service




