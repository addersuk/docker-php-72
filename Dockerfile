# Set the base image
FROM php:7.2
# Dockerfile author / maintainer 
MAINTAINER Adam Leach <docker@adamleach.uk> 

RUN apt-get update && apt-get install -y git libmcrypt-dev libpq-dev libcurl4-gnutls-dev libicu-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev libxslt1-dev libssl-dev curl
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh |  bash
RUN apt-get install git-lfs
RUN git lfs install
RUN docker-php-ext-install mbstring pdo_pgsql curl json intl gd xml zip bz2 opcache xsl
RUN docker-php-ext-install sockets
RUN pecl install ast
RUN docker-php-ext-enable ast
RUN pecl install mongodb
RUN docker-php-ext-enable mongodb
RUN pecl install xdebug-2.6.0alpha1
RUN docker-php-ext-enable xdebug
RUN curl --silent --show-error https://getcomposer.org/installer | php

