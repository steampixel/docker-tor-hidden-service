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
Bash into your webserver with "sudo ./docker-bash.sh".

## Modify the base images
You can change the base images as you want. Just go to the images folder, edit the Dockerfiles and build the new setup with "sudo ./docker-build.sh".

## Use your existing domain
You can use your existing domain. Just place your hostname and keyfils inside the hidden-service-dir folder.

## Security hardening
I have done some basic security hardening to avoid exposing information about your hidden service. The complete configuration can viewed inside the images folder:
* Docker containers does not expose any ports to your network. The webserver is only reachable through Tor.
* Disabled Apaches directory listing feature
* Disabled Apaches info and status mods
* Disabled Apaches server signatures
* Limited critical PHP resources like execution time and input memory
* Diabled PHP file uploads
* Disabled PHPs URL opening feature
* Disabled some critical PHP functions like system, exec, mail or phpinfo
* Do not allow frame embed to avoid clickjacking
* Do not allow older browsers to interpret this contentes as other mime types

## Static hosting optimizations
* Set different expire times my mime type
* Enabled deflate
