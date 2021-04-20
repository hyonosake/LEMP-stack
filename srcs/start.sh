#!bin/sh
bash ssl_gen.sh
bash db_set.sh
service php7.3-fpm start
service nginx start
bash
