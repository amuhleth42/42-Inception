# check if already installed

while ! mariadb -h$MARIADB_HOST -u$WP_DB_USR -p$WP_DB_PWD $WP_DB_NAME &>/dev/null; do
	echo "waiting for db ..."
	sleep 3
done


if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

	# install wp cli

	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/bin/wp

	# install wordpress

	wp core download --allow-root

	echo yo
	wp config create --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER \
						--dbpass=$WP_DB_PWD --dbhost=$MARIADB_HOST

	echo yo
	wp core install --url=$DOMAIN_NAME --title="INCEPTION" --admin_user=$WP_ADMIN_USR \
		--admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

	echo yo
	wp user create $WP_USR $USR_EMAIL --role=author --user_pass=$WP_PWD --allow-root

fi

# start php-fpm


