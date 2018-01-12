#!/bin/sh
export PORT=6379
export HOST=127.0.0.1

echo "Wake"
while :
do
	sleep $(( $RANDOM % 5 ))
	UUID=$(cat /proc/sys/kernel/random/uuid)
	echo "PUSHING ./fs/$UUID.date"
	echo "LPUSH work './fs/$UUID.date'" | ./mimiredis.sh
done
