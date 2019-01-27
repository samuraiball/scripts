#!/bin/sh
set -e

POSGRE_PASS=password
TODAY='date "+%Y%m%d"'

WORK_DIR=/tmp/redmine_bk
STORE_DIR=/home/redmine_bk
REDMINE_DIR=

export PGPASSWORD=$POSTGRES_PSS

mkdir $WORK_DIR
mkdir -p $STORE_DIR

pg_dump -U redmine redmine > $WORK_DIR/redmine_bk.dump
cp $REDMINE_DIR $WORK_DIR

cd $WORK_DIR
cd ..

tar -zcvf redmine_bk_$TODAY.tar.gz redmine_bk
mv $WOEK_DIR/redmine_bk_$TODAY.tar.gz $STORE_DIR

rm -rf $WORK_DIR
