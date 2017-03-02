FROM centos:latest
RUN yum update -y && yum install -y http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm && yum install -y Percona-Server-server-56 percona-xt
rabackup ntpdate -y && rm -rf /etc/my.cnf && \cp /usr/share/zoneinfo/Asia/Chongqing /etc/localtime
COPY ./init.sh /init.sh
ENV TZ=Asia/Chongqing
EXPOSE 3306
USER root
WORKDIR /
CMD ["/bin/bash","init.sh"]
