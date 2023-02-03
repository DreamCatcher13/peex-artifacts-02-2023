#!/bin/bash

addr=$(ip addr | grep -oE 192.168.0.1[0-9]{2})

if [ -z "$1" ]; then
  echo "[ERR] Script usage: runserver.sh <app_name>"
  exit 1
fi

mng="/home/blindguardian/learning_django/$1/manage.py"

if [ ! -f $mng ]; then
  echo "[ERR] No such file"
  exit 1
fi

python3 $mng runserver "$addr:8000" &

echo "Your app address: $addr:8000"
echo "Your process id: $!"
