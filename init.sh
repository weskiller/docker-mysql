#!/bin/bash
exec >&2
if ! chown -R mysql.mysql /var/lib/mysql;then
        echo "can't change owner and group for mysql on /var/lib/mysql!"
        exit 1
fi
path_socket=/var/lib/mysql/mysql.sock
if [ -f /etc/my.cnf ];then
        mysql_config="/etc/my.cnf"
        path_socket=$(grep -i -P "^\S*socket" /etc/my.cnf|awk -F= 'END{print $2}')
else
        echo "/etc/my.cnf not define!"
        exit 2
fi
if [ "$(echo /var/lib/mysql/*)" == '/var/lib/mysql/*' ];then
        mysql_install_db --defaults-file=${mysql_config}
        if [ $? -ne 0 ];then
                echo "initialize MySQL data failed!"
                exit 3
        fi
fi
rm -f $path_socket
exec mysqld_safe --defaults-file=${mysql_config}
