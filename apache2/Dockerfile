FROM php:7.1-apache
RUN docker-php-source extract \
    # do important things \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-enable pdo_mysql \
    && docker-php-source delete
RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng12-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd
COPY config/php.ini /usr/local/etc/php/

RUN apt-get install -y \ 
                jpegoptim \ 
                pngquant

RUN rm /etc/apache2/sites-enabled/000-default.conf
ADD symfony.conf /etc/apache2/sites-available/
RUN a2ensite symfony.conf
RUN a2enmod rewrite
RUN groupadd vboxsf -g 122
RUN usermod -u 1000 www-data
RUN usermod -G vboxsf -a www-data
#RUN echo "127.0.0.1 base_project.local.com" >> /etc/hosts
EXPOSE 80
#CMD service apache2 start

