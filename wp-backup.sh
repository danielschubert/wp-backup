# Creates Backup from a Wordpress Site and Database
# Author: Daniel Schubert <mail@schubertdaniel.de>
# last change : 29. Sept. 2014

function db_backup {
	
	# Vars
	host=<host>
	user=<username>
	pass=<password>
	db=<databas>

	echo 'DB Export ------> '
	mysqldump --opt --add-drop-table -h$host -u$user -p$pass $db | gzip > wp-db.sql.gz
}

function file_backup {
	backupfile="wordpress-backup.tar"

	echo 'File Backup --- building tar File...'
	tar -cf $backupfile ../wp*
}


echo '-------------------------------------------'
echo 'Awesome Wordpress Backup Script'
echo '-------------------------------------------'

backupdir=backup

mkdir $backupdir
cd $backupdir

db_backup
file_backup
echo '+DONE'
