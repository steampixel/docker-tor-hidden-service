# Tor hidden service with Apache, PHP and Docker
Hey! This is a simple Tor hidden service setup! Use Docker to spin up a hidden Tor service and host your website data anonymously. I have done some basic security hardening. This setup supports PHP. Your onion domain will be generated automatically.

## Start the service
1. Clone this repository to your local machine
2. Place your .html and .php files inside the html folder
3. Start the service with "sudo ./docker-run.sh"
4. Copy your generated onion domain from the terminal and past it into the tor browser

## Stop the servie
Stop the service with "sudo ./docker-rm.sh"
After the services was stopped all logs will get written to the logs folder.

## Bash into your webserver
Bash into your webserver with "sudo ./docker-bash".

## Use your existing domain
You can use your existing domain. Just place your hostname and keyfils inside the hidden-service-dir folder.
