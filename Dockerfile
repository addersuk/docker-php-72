# Set the base image
FROM php:7.2
# Dockerfile author / maintainer 
MAINTAINER Adam Leach <docker@adders.eu> 

RUN apt-get update && apt-get install -y git libmcrypt-dev libpq-dev libcurl4-gnutls-dev libicu-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev libxslt1-dev libssl-dev git-lfs
RUN docker-php-ext-install mbstring pdo_pgsql curl json intl gd xml zip bz2 opcache xsl
RUN docker-php-ext-install sockets
RUN pecl install ast
RUN docker-php-ext-enable ast
RUN pecl install mongodb
RUN docker-php-ext-enable mongodb
RUN pecl install xdebug-2.6.0alpha1
RUN docker-php-ext-enable xdebug
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --install-dir=/usr/local/bin 
RUN php -r "unlink('composer-setup.php');"
