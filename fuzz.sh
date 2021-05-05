#!/bin/bash
TARGET="./target"
i=1
sp="/-\|"

echo "[+] Start fuzzing!!!"
SEED=`cat seed`
CORPUS=$SEED

while [ true ] ;
do
	CORPUS=`echo "$CORPUS" | radamsa`

	RESULT=`$TARGET $CORPUS`
	if [[ $? -eq 139 ]]; then
		echo "[!] CRASH FOUND(SIGSEGV)"
		echo $CORPUS > crash_`date +%s`
	fi

	printf "\b${sp:i++%${#sp}:1}"

done
