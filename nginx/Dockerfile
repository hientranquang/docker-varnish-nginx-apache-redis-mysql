FROM debian:jessie

# File Author / Maintainer
MAINTAINER Maintaner Name

# Install Nginx


# Update the repository
RUN apt-get update

# Install necessary tools
RUN apt-get install -y nano wget dialog net-tools

# Download and Install Nginx
RUN apt-get update && apt-get install -y \
    nginx
# Remove the default Nginx configuration file
#RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD nginx.crt /etc/nginx/ssl/
ADD nginx.key /etc/nginx/ssl/
#ADD nginx.conf /etc/nginx/
ADD site.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site
RUN rm /etc/nginx/sites-enabled/default

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN groupadd vboxsf -g 122
RUN usermod -u 1000 www-data
RUN usermod -G vboxsf -a www-data
#RUN mkdir /etc/nginx/ssl
#RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt
# Expose ports
#EXPOSE 80
EXPOSE 443

# Set the default command to execute
# when creating a new container
CMD service nginx start
 


