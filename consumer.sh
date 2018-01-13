#!/bin/sh
export PORT=6379
export HOST=127.0.0.1
while :
do
	R=$(echo "RPOP work" | ./mimiredis.sh)
	if [[ "$R" != "(nil)"  ]];then
		echo "Creating $R"
		d=$(date --iso-8601=seconds | sed 's/:/-/')
		echo $d >> $R
			
		M=$(echo "LPUSH done \"$R\"" | ./mimiredis.sh)
	else
		sleep 0.5
	fi
done
