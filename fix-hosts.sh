#!/bin/bash
set -e

IP_URL=$(< commit-trigger.txt)
IP=${IP_URL% *}
URL=${IP_URL#* }
DOMAIN=${URL#http://}
test "$IP" -a "$DOMAIN"
if [ "$DOMAIN" != "s2.stridespace.com" ]; then
  sudo apt-get install -qq -y --force-yes dnsmasq
  echo "listen-address=127.0.0.1" | sudo tee -a /etc/dnsmasq.conf > /dev/null 2>&1
  echo "bind-interfaces" | sudo tee -a /etc/dnsmasq.conf > /dev/null 2>&1
  echo "address=/$DOMAIN/$IP" | sudo tee -a /etc/dnsmasq.conf
  echo "user=root" | sudo tee -a /etc/dnsmasq.conf > /dev/null 2>&1
  sudo service dnsmasq restart
fi

echo $URL > testspace-url
