#!/usr/bin/env bash

if [ "${1}" == "push" ]; then
	git add .;
	git commit -m "$(date +"%F %H:%M:%S")"
	git push origin master;
else
	echo "error"
fi
