#!/bin/bash

<<info
This shell script will take periodic backup
can also be use crontab
e.g
 ./backup.sh <source> <dest>
src = /home/ubuntu/scripts
dest = /home/ubuntu/backup

info

src=$1
dest=$2

timestamp=$(date '+%Y-%m-%d_%H-%M')
zip -r "$dest/backup-$timestamp.zip" $src > /dev/null

aws s3 sync "$dest" s3://shell-backups-1

echo "Backup-Completed & Uploaded to s3"
