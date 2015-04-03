#!/bin/sh

#
# USAGE: restore_db.sh DBNAME FILENAME
#
# e.g. restore_db.sh test test.sql
#
# (FILENAME can optionally be a gzipped file)
#

DBNAME=$1
FILENAME=$2

DBUSER=root
DBPASSWORD={{ mysql_root_password }}

if [ -z "$DBNAME" ] || [ -z "$FILENAME" ] ; then
    echo ""
    echo "    restore_db.sh - R K Allen"
    echo ""
    echo "    USAGE: restore_db.sh <DBNAME> <FILENAME>"
    echo ""
    exit;
fi

if [ -e ${FILENAME}.gz ] ; then
    echo "Found ${FILENAME}.gz. Restoring..."
    gzcat ${FILENAME}.gz | mysql -u ${DBUSER} -p${DBPASSWORD} ${DBNAME}
else
    echo "Found ${FILENAME}. Restoring..."
    mysql -u ${DBUSER} -p${DBPASSWORD} ${DBNAME} < ${FILENAME}
fi
