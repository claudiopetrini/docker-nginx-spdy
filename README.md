# docker-nginx-spdy

## Build

Build the container as follows:

`docker build -t your/tag .`

## Run

Run the container attaching the sites-enabled volume:

`docker run -d -v /host/path:/etc/nginx/conf/sites-enabled -p 80:80 your/tag` 