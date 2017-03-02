FROM percona:5.6
MAINTAINER weskiller weskiller@vip.qq.com
COPY ./innobackupex ./xbcloud ./xbcloud_osenv ./xbcrypt ./xbstream ./xtrabackup /usr/bin/
