#!/bin/sh
export PORT=6379
export HOST=127.0.0.1
while :
do
	R=$(echo "RPOP done" | ./mimiredis.sh)
	if [[ "$R" != "(nil)"  ]];then
		echo "DONE $R"
	fi
done
