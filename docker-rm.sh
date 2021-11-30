#!/bin/bash

# Capture the docker logs
sudo docker logs steampixel-apache-php > "logs/apache-$(date +"%Y_%m_%d_%H_%M_%S").log"
sudo docker logs steampixel-tor-hidden-service > "logs/tor-$(date +"%Y_%m_%d_%H_%M_%S").log"

# Stop and remove the containers
sudo docker stop steampixel-apache-php
sudo docker rm steampixel-apache-php

sudo docker stop steampixel-tor-hidden-service
sudo docker rm steampixel-tor-hidden-service
