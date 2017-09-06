FROM        debian:jessie
MAINTAINER  Frank Lemanschik
 
ENV DEBIAN_FRONTEND noninteractive

# Update apt sources
#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

# Update the package repository
RUN apt-get -qq update

# Install base system
RUN apt-get install -y varnish vim git


########################

# Install necessary tools
RUN apt-get install -y nano wget dialog net-tools curl 

# Download and Install Nginx
RUN apt-get install -y \
    nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
###############################

# Make our custom VCLs available on the container
ADD default.vcl /etc/varnish/default.vcl

# Export environment variables
ENV VARNISH_PORT 81

# Expose port 80
#EXPOSE 80

ADD parse /parse
ADD start /start

RUN chmod 0755 /start /parse


# Expose ports
EXPOSE 80
EXPOSE 81
#EXPOSE 443

# Set the default command to execute
# when creating a new container
#CMD service nginx start
CMD ["/start"]

