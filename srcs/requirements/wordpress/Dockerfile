FROM  debian:buster

RUN apt update

RUN apt install -y php7.3-fpm php7.3-mysql wget tar mariadb-client

# install wp-cli

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp

#install wordpress

ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz
RUN cd /var/www/ && \
	tar -xvf latest.tar.gz && \
	rm -rf latest.tar.gz

# init.sh

COPY tools/init.sh /run

CMD ["bash", "/run/init.sh"]
