#!/bin/bash

# Backup mysqldb and gzip the content
# Parameters:
# $1: db name

usage() {
  echo "Missing parameter DB" && exit 1
}

DBNAME=$1
if [ -z "$DBNAME" ]; then
  usage
fi

echo "Backuping $DBNAME..."
mysqldump "$DBNAME" --add-drop-table | gzip -c >"$DBNAME.sql.gz"
if [ $? -ne 0 ]; then
  echo "Backup failed"
  exit 1
fi
