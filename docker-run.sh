#!/bin/bash

# Test via tor2web:
# https://***.onion.ws/
# https://***.onion.pet/
# https://***.onion.sh/
# https://***.onion.tor2web.to/
# https://***.onion.darknet.to/

# Set ownership and permissions internal tor user
sudo chown -R 100:100 hidden-service-dir
sudo chmod -R 700 hidden-service-dir

# Run Apache
# Note: Do not expose any ports here! We dont want this contents to be exposed by a second host!
sudo docker run -d \
	-v `pwd`/html:/var/www/html \
	-v `pwd`/my-httpd.conf:/usr/local/apache2/conf/httpd.conf \
	--name steampixel-apache-php \
	steampixel:apache-php

# Run tor
sudo docker run -d \
	-v `pwd`/hidden-service-dir:/var/lib/tor/hidden-service-dir \
	--link steampixel-apache-php:apache \
	--name steampixel-tor-hidden-service \
	steampixel:tor-hidden-service

# Give the services some time to spin up
sleep 5

# Show the onion domain
echo 'Open Tor and navigate to: '
sudo cat hidden-service-dir/hostname
