#!/bin/bash

mvfile() {
	filename=$(basename "${1}")
	filepath=$(dirname "${1}")
	extension="${filename##*.}"
	filename="${filename%.*}"
	# remove () unless nested, remove [] unless nested, remove leading/trailing spaces
	mv_file=$(echo $filename | sed "s/([^()]*)//g" | sed -e 's/\[[^][]*\]//g' | xargs)
	mv -v "${1}" "${filepath}/${mv_file}.${extension}"
}

# if $1 doesn't exist
if [ -z "$1" ]; then
	echo "No argument supplied"
	for file in *; do 
		mvfile "${file}"
	done
else
	for file in "${1}"/*; do   # this will have a leading path
		mvfile "${file}"
	done

fi
