FROM debian:buster

RUN apt update

RUN apt install -y mariadb-server

COPY tools/init.sh /tmp/init.sh

CMD ["bash", "/tmp/init.sh"]
