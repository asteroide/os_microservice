#!/bin/bash

mv /etc/mysql/my.cnf /etc/mysql/my.cnf.old

sed "s/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/g" /etc/mysql/my.cnf.old | tee /etc/mysql/my.cnf

tee -a << EOF /etc/mysql/conf.d/encode.cnf
# File edited for fullfilling UTF-8 compatibility between MySQL & OpenStack.
  
[mysqld]
collation-server= utf8_general_ci
character-set-server = utf8
EOF

service  mysql restart

mysql -uroot -p$1 < /tmp/keystone_init.sql.new