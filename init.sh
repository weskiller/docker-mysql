#!/bin/bash

if [ -f /etc/my.cnf ];then
	mysql_config="/etc/my.cnf"
else
	echo >&2 "echo /etc/my.cnf not define!"
	exit 1
fi

if [ "$(echo /var/lib/mysql/*)" == '/var/lib/mysql/*' ];then
	mysql_install_db --defaults-file=${mysql_config}
fi

exec mysqld_safe --defaults-file=${mysql_config}
