#!/bin/bash

DATABASE_NAME="laundryMan"
USERNAME="root"
PASSWORD="hyperbeam150"
HOST="localhost"

echo "Creating database $DATABASE_NAME..."
mysql -u $USERNAME -p$PASSWORD -h $HOST -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"

for file in *.sql; do
	echo "Importing $file into $DATABASE_NAME"
	mysql -u $USERNAME -p$PASSWORD $DATABASE_NAME < "$file"
done

echo "All files imported"

echo "Now exporting files"

mysqldump -u $USERNAME -p$PASSWORD -h $HOST $DATABASE_NAME > "$DATABASE_NAME.db"
