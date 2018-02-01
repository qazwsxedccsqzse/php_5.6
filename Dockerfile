FROM phusion/baseimage
RUN apt-get update && apt-get install -y git
RUN echo "* soft nofile 64000" >> /etc/security/limits.conf
RUN echo "* hard nofile 64000" >> /etc/security/limits.conf
RUN echo "root hard nofile 64000" >> /etc/security/limits.conf
RUN echo "root hard nofile 64000" >> /etc/security/limits.conf
RUN echo "session required        pam_limits.so" >> /etc/pam.d/common-session
RUN echo "session required        pam_limits.so" >> /etc/pam.d/common-session-noninteractive
RUN echo "ulimit -HSn 64000" >> /etc/profile
RUN apt-get install -y imagemagick libmagickwand-dev libmagickcore-dev
RUN add-apt-repository ppa:ondrej/php && apt-get update
RUN apt-get install -y php5.6 \
php5.6-xml \
php5.6-dev \
php5.6-fpm \
php5.6-mysql \
php5.6-mbstring \
php5.6-curl \
php5.6-gd \
php-imagick \
php-redis \
php-memcache
RUN pecl install apcu-4.0.11
RUN echo "extension=apcu.so" >> /etc/php/5.6/fpm/php.ini
