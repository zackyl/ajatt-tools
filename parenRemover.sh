#!/bin/bash

# path=$1
# for currDir in "${path}/*";
for currDir in *;
	do mvDir=$(echo $currDir | sed "s/([^()]*)//g" | sed -e 's/\[[^][]*\]//g');
	# mv "${currDir}" "${mvDir}"; 
	mvDir="${mvDir/ /}";
	mvDir="${mvDir/_/}";
	mv -v "${currDir}" "${mvDir}"
	echo $currDir; 
	echo $mvDir;
done

# find files/ -type f -name '.*' -printf '%P\0' |
#     while read -d $'\0' path; do
#         dir=$(dirname "$path")
#         file=$(basename "$path")
#         mv "$dir/$file" "$dir/${file#.}"
#         echo "$dir/${file#.}"
#         echo '---------'
#     done


# find "${path}/" -type f -iname '.*'|while read f; do
#         mv "$f" "${f#.}"
#         echo 'what'
#         echo $f
#         echo "${f#.}"
# done

# find "${path}/" -name '.*' |while read f; do
#         mv "${path}/$f" "${path}/${f#.}"
# done

# find "${path}/" -type f -name '.*' -printf '%P\0'|
#     while read -d $'\0' filepath; do
#         dir=$(dirname "$filepath")
#         file=$(basename "$filepath")
#         mv "$dir/$file" "$dir/${file#.}"
#     done