#!/bin/bash

#checking for arguments
if [[ -z "$1"]] 
then
    echo "Script usage: backup.sh <full_path_to_directory>"
    exit 1
fi

#setting variables
DATE=`date "+%Y-%m-%d"`
BACKUP="$(getent passwd "$USER" | cut -d: -f6)/backup"

#checking if directory exists
for DIR in "$@"
do 
    if [[ ! -d "$DIR" ]]
    then
        echo "[ERR] Not a directory or the directory doesn't exist"
        exit 1
    fi
done 

#checking if backup directory exists and creating it
if [[ ! -d "$BACKUP" ]]
then 
    echo "Creating $BACKUP directory.."
    mkdir -p ~/backup
fi

#making backup
echo "Making backup..."
for DIR in "$@"
do
    FILE_NAME="$BACKUP/$(basename $DIR)_$DATE.tar.gz"
    tar -zcf "$FILE_NAME" -C "$(dirname $DIR)" "$(basename $DIR)"  
done
echo "#########"
echo "Backup is made."
