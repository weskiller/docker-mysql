FROM centos:latest
RUN yum update -y && yum install -y http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm && yum install -y Percona-Server-server-56 percona-xtrabackup -y && rm -rf /etc/my.cnf /var/lib/mysql/* && mkdir -p /var/log/mysql && chown -R mysql.mysql /var/log/mysql && \cp /usr/share/zoneinfo/Asia/Chongqing /etc/localtime
ENV TZ=Asia/Chongqing DATADIR=/var/lib/mysql
COPY ./init.sh /init.sh
EXPOSE 3306
USER mysql
WORKDIR $DATADIR
CMD ["/bin/bash","/init.sh"]
