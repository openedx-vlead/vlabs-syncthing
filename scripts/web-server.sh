#!/bin/bash
#Author : Raghupathi Kammari

#FILE="/root/labs/vlabs-dev-pages/scripts/links-to-google-groups.txt"
NGINX_HOST="/etc/nginx/sites-enabled/default"

sudo sed -i '/SSL configuration/r /root/labs/vlabs-syncthing/scripts/upstream.txt' $NGINX_HOST
sudo sed -i '/First attempt/r /root/labs/vlabs-syncthing/scripts/passing-to-proxy.txt' $NGINX_HOST
