#!/bin/sh
export PORT=6379
export HOST=127.0.0.1
while :
do
	R=$(echo "LPOP work" | ./mimiredis.sh)
	#F="./fs/$R.txt"
	if [[ "$R" != "(nil)"  ]];then
		echo "Creating $R"
		d=$(date --iso-8601=seconds | sed 's/:/-/')
		echo $d >> $R 
	fi
	#sleep 1
done
