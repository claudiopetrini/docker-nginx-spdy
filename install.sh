#nginx version
NGINX_VERSION=1.7.11

#openssl version
OPENSSL_VERSION=1.0.1l

#Directories
CURRENT_DIR=$(pwd)
OPENSSL_DIR=$(pwd)/openssl-${OPENSSL_VERSION}

#DEBIAN_FRONTEND=noninteractive

# Install dependencies
apt-get update -qq 
apt-get install -yqq  apt-utils build-essential zlib1g-dev libpcre3 libpcre3-dev openssl libssl-dev libperl-dev wget zip ca-certificates curl

# Save the nginx version
curl -O http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz

# Extracting nginx 
echo $NGINX_VERSION
tar -xvf nginx-$NGINX_VERSION.tar.gz

# Save the openssl version
curl -O https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz

# Extracting openssl
tar -xvf openssl-$OPENSSL_VERSION.tar.gz

# Entering inside the nginx folder

cd nginx-${NGINX_VERSION}
# Configuring 
./configure  \
--prefix=/etc/nginx \
--with-http_ssl_module \
--with-http_spdy_module \
--with-openssl=${OPENSSL_DIR} \
--with-cc-opt="-Wno-deprecated-declarations"

KERNEL_BITS=64 make

# Compiling everything on 64 bits systems
KERNEL_BITS=64 make install

#Cleaning sources
cd ${CURRENT_DIR}
rm *.tar.gz
rm -rf nginx-${NGINX_VERSION} ${OPENSSL_DIR}

echo "daemon off;" >> /etc/nginx/conf/nginx.conf
