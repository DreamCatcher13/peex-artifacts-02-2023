#!/bin/bash

echo "Making backup of learning log files..."
echo "###"
DATE=`date "+%Y-%m-%d__%H-%M-%S"`
FILE_NAME="/home/blindguardian/backup/ll_dump_${DATE}.tar.gz"
tar -zcf $FILE_NAME /home/blindguardian/learning_django/learning_log/
echo "Backup is made."
