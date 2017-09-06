FROM php:7.0-apache
RUN docker-php-source extract \
    # do important things \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-enable pdo_mysql \
    && docker-php-source delete
RUN rm /etc/apache2/sites-enabled/000-default.conf
ADD symfony.conf /etc/apache2/sites-available/
RUN a2ensite symfony.conf
RUN a2enmod rewrite
#RUN groupadd vboxsf -g 122
#RUN usermod -u 1000 www-data
#RUN usermod -G vboxsf -a www-data
#RUN echo "127.0.0.1 base_project.local.com" >> /etc/hosts
EXPOSE 80
#CMD service apache2 start

