#!bin/sh
mkdir /etc/nginx/ssl/
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 \
		-nodes -out /etc/nginx/ssl/key.pem -keyout /etc/nginx/ssl/key.key -subj "/CN=key"