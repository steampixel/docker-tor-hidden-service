
# I used PHP here but you can use any other Apache image
FROM php:8.0-apache

# Enable mod rewrite
RUN a2enmod rewrite

# Now we will secure the Apache instance
# Here you can find more details: https://blog.0day.rocks/securing-a-web-hidden-service-89d935ba1c1d

# Disable directory listing
RUN a2dismod autoindex -f

# Disable server info and server status
RUN a2dismod info -f
RUN a2dismod status -f

# Disable server signature
RUN echo "ServerSignature Off" >> /etc/apache2/conf-enabled/security.conf
RUN echo "ServerTokens Prod" >> /etc/apache2/conf-enabled/security.conf

# Do some PHP security hardening
RUN { \
	echo 'always_populate_raw_post_data = -1'; \
	echo 'max_execution_time = 30'; \
	echo 'max_input_time = 60'; \
	echo 'max_input_vars = 1000'; \
	echo 'memory_limit = 8M'; \
	echo 'upload_max_filesize = 2M'; \
	echo 'post_max_size = 2M'; \
	echo 'expose_php = Off'; \
	echo 'display_errors = Off'; \
	echo 'error_reporting = 0'; \
	echo 'file_uploads = Off'; \
	echo 'register_globals = Off'; \
	echo 'allow_url_fopen = Off'; \
	echo 'safe_mode_allowed_env_vars = PHP_'; \
	echo 'sql.safe_mode = On'; \
	echo 'disable_functions = phpinfo,mail,exec,passthru,shell_exec,system,proc_open,popen,curl_exec,curl_multi_exec,parse_ini_file,show_source'; \
} > /usr/local/etc/php/conf.d/hidden.ini
