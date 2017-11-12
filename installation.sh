#!/bin/bash
apt-get -y update
apt-get -y install mysql-server
service mysql restart
bash mysqlconfig.sh
