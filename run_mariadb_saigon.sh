#!/bin/bash -x
for db in $(echo "show databases;" | mysql | grep -v information_schema | grep -v test | grep -v performance_schema); do 
    mysqldump --single-transaction --force -B ${db} > ${db}.sql 
    gzip ${db}.sql 
    echo "done with ${db}" 
done
mv mysql.sql.gz mysql.sql.gz_DISABLED
echo "Done with our saigan extraction. Please note, if you import the mysql.sql.gz file you will overwrite existing users/perms! (moved out of the way)"
