#!/bin/bash
set -e

IP_URL=$(< commit-trigger.txt)
IP=${IP_URL% *}
URL=${IP_URL#* }
DOMAIN=${URL#http://}
test "$IP" -a "$DOMAIN"
if [ "$DOMAIN" != "s2.stridespace.com" ]; then
  echo $IP $DOMAIN | tee -a /etc/hosts
fi

echo $URL > testspace-url
