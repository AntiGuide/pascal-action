#!/bin/sh
while IFS= read -r path || [ -n "$path" ]
do
    #docName="${path%"${path##*[!/]}"}"
    #docName="${docName##*/}"
    #w_dir=${PWD}
    #cd $path
    #latexmk -pdf -interaction=nonstopmode main.tex

    fpc "$path"
    result=$(${1%.*})
    echo ::set-output name=result::"$result"

    #result=$?
    #if [ $result != 0 ]; then
    #   failed[i]=$docName
	  #   i=i+1
    #fi
    #cd $w_dir;
    #if [ "${INPUT_ARTIFACT}" == true ]; then
    #      mv $path/main.pdf ./Documents/$docName.pdf
    #fi
done < "${INPUT_PATH_TO_LIST}"
exit 0
