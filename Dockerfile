FROM centos:latest
RUN yum update -y && yum install -y http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm && yum install -y Percona-XtraDB-Cluster-server-56 pe
rcona-xtrabackup && rm -rf /etc/my.cnf && systemctl enable mysqld
EXPOSE 3306
USER mysql
CMD [""]
