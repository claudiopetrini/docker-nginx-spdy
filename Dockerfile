FROM google/debian:wheezy

MAINTAINER Claudio Petrini <claudio.petrini@stamplay.com>

COPY install.sh .

# Configuring
RUN chmod +x install.sh
RUN ./install.sh

EXPOSE 80
EXPOSE 443

VOLUME ["/etc/nginx/conf/sites-enabled"]

# Configure nginx
COPY nginx.conf /etc/nginx/conf/nginx.conf

CMD ["/etc/nginx/sbin/nginx"]

