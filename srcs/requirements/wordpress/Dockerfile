FROM  debian:buster

RUN apt update

RUN apt install -y php-fpm php-mysql wget tar mariadb-client

COPY tools/init.sh /run

CMD ["bash", "/run/init.sh"]
