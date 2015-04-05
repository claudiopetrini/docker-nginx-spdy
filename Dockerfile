FROM google/debian:wheezy

MAINTAINER Claudio Petrini <claudio.petrini@stamplay.com>

COPY install.sh .

# Entering inside the nginx folder

# Configuring
RUN ./install.sh

EXPOSE 80
EXPOSE 443

VOLUME ["/etc/nginx/conf/sites-enabled"]

CMD ["/etc/nginx/sbin/nginx"]

# Configure nginx
COPY nginx.conf /etc/nginx/conf/nginx.conf