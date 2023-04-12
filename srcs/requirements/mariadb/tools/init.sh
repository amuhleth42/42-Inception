echo "yo le pote !"

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

echo "yo les potes !"



#tail -f
exec /usr/bin/mysqld --user=mysql --console
