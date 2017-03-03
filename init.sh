#!/bin/bash
exec >&2
path_socket=/var/lib/mysql/mysql.sock
if [ -f /etc/my.cnf ];then
	mysql_config="/etc/my.cnf"
	path_socket=$(grep -i -P "^\S*socket" /etc/my.cnf|awk -F= 'END{print $2}')
else
	echo "echo /etc/my.cnf not define!"
	exit 1
fi

if [ "$(echo /var/lib/mysql/*)" == '/var/lib/mysql/*' ];then
	mysql_install_db --defaults-file=${mysql_config}
fi
rm -f $path_socket
exec mysqld_safe --defaults-file=${mysql_config}
