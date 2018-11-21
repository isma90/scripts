#!/bin/bash

while getopts ":m:" opt; do
  case $opt in
    m) message="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

if [ -z ${message+x} ]; then
	echo "Argument -m is required"
	exit 1
fi

printf "Argument message is %s\n" "$message"

npm run build
git status
git add .
git commit -m "${message}"
git push
npm publish
