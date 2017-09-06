FROM debian:jessie
RUN apt-get update
RUN apt-get install varnish -y
COPY backends.vcl /etc/varnish/default.vcl

EXPOSE 6081

# Set the default command to execute
# when creating a new container
CMD service varnish start
