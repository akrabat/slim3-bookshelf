#!/bin/sh

#
# USAGE: backup_db.sh DBNAME FILENAME [COMPRESS=0]
#
# e.g. backup_db.sh test test.sql
#

DBNAME=$1
FILENAME=$2
COMPRESS=$3

DBUSER=root
DBPASSWORD={{ mysql_root_password }}

if [ -z "$DBNAME" ] || [ -z "$FILENAME" ]; then
    echo ""
    echo "    backup_db.sh - R K Allen"
    echo ""
    echo "USAGE: backup_db.sh <DBNAME> <FILENAME> [<COMPRESS>=1]"
    echo "       set COMPRESS to 1 to gzip output file"
    echo ""
    exit;
fi

if [ -z "$COMPRESS" ]; then
    COMPRESS=0
fi

mysqldump -u ${DBUSER} -p${DBPASSWORD} --add-drop-table --hex-blob \
    --add-locks --quick --lock-tables $DBNAME > ${FILENAME}

if [ "$COMPRESS" -eq 1 ]; then
    gzip -f9 ${FILENAME}
fi
