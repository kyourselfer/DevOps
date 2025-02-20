#!/bin/env bash
set +x
LIST_OF_LOGS="`ls -lht $1 | awk '{print $NF}' | grep postgresql | xargs`"


for LOG_FILE in $LIST_OF_LOGS
do
	ls -lh $LOG_FILE
	echo -ne "\tКол-во строк: " && wc -l $LOG_FILE
	echo -e "Строки длинее 2047B"
	while IFS= read -r line; do echo -n $line | tr -cd ',' | wc -c; done < $LOG_FILE | awk '$0 > 246780'
        echo -e "\n"
done
