#!/bin/sh
export PORT=6379
export HOST=127.0.0.1

echo "Wake"
while :
do
s=$(( $RANDOM % 5 ))
sleep $s
d=$(date --iso-8601=seconds | sed 's/[:+]/-/g')
UUID=$(cat /proc/sys/kernel/random/uuid)
echo "LPUSH work './fs/$UUID.date'" | ./mimiredis.sh
done
