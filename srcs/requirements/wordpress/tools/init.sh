# check if already installed

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

	# install wp cli

	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/bin/wp

	# install wordpress

	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz

	wp config create --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER \
						--dbpass=$WP_DB_PWD --dbhost=$MARIADB_HOST
	
