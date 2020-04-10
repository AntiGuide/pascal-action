#!/bin/sh
while IFS= read -r path || [ -n "$path" ]
do
    fpc "$path"
    result=$?

    if [ $result != 0 ]; then
       failed[i]=$docName
	     i=i+1
    fi
done < "${INPUT_PATH_TO_LIST}"

if [ $i != 0 ]; then
    echo -e "\n The following scripts could not be compiled:"
    for x in "${failed[*]}"; do echo "- $x"; done
    exit 1
fi

exit 0
