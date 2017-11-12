#!/bin/bash
service mysql restart
read -sp 'Password root mysql: ' dbpwd
mysql -u root -e "create database mayan_db" --password=$dbpwd
mysql -u root -e 'CREATE USER "mayan_user"@"localhost"' --password=$dbpwd
read -sp 'Password mayan db: ' mayanpwd

mysql -u root -e 'SET password FOR "mayan_user"@"localhost" = password("$mayanpwd")' --password=$dbpwd
mysql -u root -e 'GRANT ALL ON mayan_db.* TO "mayan_user"@"localhost"' --password=$dbpwd

mysql -u root -e 'GRANT ALL privileges on mayan_user.* to mayan_user@127.0.0.1 identified by "$mayanpwd"'  --password=$dbpwd
mysql -u root -e 'flush privileges;'
service mysql restart

