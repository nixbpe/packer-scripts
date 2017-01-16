#!/bin/bash

wget http://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm
yum -y localinstall mysql57-community-release-el6-7.noarch.rpm
yum -y install mysql-community-server

# service mysqld start
# grep 'temporary password' /var/log/mysqld.log

echo "collation-server = utf8_unicode_ci" >> /etc/my.cnf
echo "init-connect='SET NAMES utf8'" >> /etc/my.cnf
echo "character-set-server = utf8" >> /etc/my.cnf