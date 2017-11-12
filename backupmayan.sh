#!/bin/bash
echo "back mayan db ... "
mkdir -p backups_mayan 
cd mayan_db_backup.sql
mysqldump -u mayan_user -p mayan_db > mayan_db_backup.sql
tar -zcvf backup.tar.gz /var/lib/docker/volumes/mayan_data/_data/document_storage /var/lib/docker/volumes/mayan_data/_data/settings
tar -zcvf "backup_mayan $(date '+%y-%m-%d').tar.gz" backup.tar.gz mayan_db_backup.sql
rm backup.tar.gz  mayan_db_backup.sql
