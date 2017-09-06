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
#ADD nginx.conf /etc/nginx/
ADD symfony.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/symfony.conf /etc/nginx/sites-enabled/symfony
#RUN rm /etc/nginx/sites-enabled/default

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN groupadd vboxsf -g 122
RUN usermod -u 1000 www-data
RUN usermod -G vboxsf -a www-data

# Expose ports
EXPOSE 80
#EXPOSE 443

# Set the default command to execute
# when creating a new container
CMD service nginx start
 


