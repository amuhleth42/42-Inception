# wait for mariadb
#while ! mariadb -h$MARIADB_HOST -u$WP_DB_USR -p$WP_DB_PWD $WP_DB_NAME &>/dev/null; do
	#echo "waiting for db ..."
	sleep 6
#done

echo "on sort du whiled"

#sleep infinity

	cd /var/www/wordpress

	sed -i "s/username_here/$WP_DB_USR/g" wp-config-sample.php
	sed -i "s/password_here/$WP_DB_PWD/g" wp-config-sample.php
	sed -i "s/localhost/$MARIADB_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$WP_DB_NAME/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

	echo yo
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR \
		--admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

	echo yo
	wp user create $WP_USR $USR_EMAIL --role=author --user_pass=$WP_PWD --allow-root

# start php-fpm

