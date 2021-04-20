FROM debian:buster
WORKDIR /var/www/ffarah_server
RUN apt-get update && apt-get -y upgrade && apt-get -y install wget

#--no-install-recommends
RUN apt-get install -y nginx

RUN apt-get -y install mariadb-server 

RUN apt-get -y install php7.3 php-mysql php7.3-fpm php-pdo php-gd php-cli php-mbstring

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz \
	&& tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz \
	&& mv phpMyAdmin-5.0.2-all-languages phpmyadmin \
	&& rm -rf phpMyAdmin-5.0.2-all-languages.tar.gz

RUN wget https://wordpress.org/latest.tar.gz \
	&& tar -xzvf latest.tar.gz \
	&& mv latest.tar.gz wordpress \
	&& rm -rf latest.tar.gz
#RUN apt-get -y install wordpress
RUN chmod -R 775 ./*

# RUN mv ./config.inc.php ./phpmyadmin/ 
# RUN mv ./nginx.conf /etc/nginx/sites-enabled/ \
# 	&& mv ./wp-config.php ./wordpress/

COPY ./srcs/config.inc.php ./phpmyadmin/
COPY ./srcs/nginx.conf /etc/nginx/sites-enabled/
COPY ./srcs/wp-config.php ./wordpress/

CMD bash start.sh
EXPOSE 80 443