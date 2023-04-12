FROM  debian:buster

RUN apt update

RUN apt install -y php-fpm php-mysql wget tar mariadb-client

CMD ["bash", "tools/init.sh"]
