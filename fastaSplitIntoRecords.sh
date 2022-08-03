#!/bin/bash

while read line
do
    if [[ ${line:0:1} == '>' ]] # files starting with '>'
    then
        outfile=$(echo "${line#>}" | cut -d ' ' -f4).fasta # '${line#>}' is the enter heading, 
                                                           # 'cut' separates parts based on space
                                                           # '-f4' picks up the fourth part
        echo $line > "$outfile"
    else
        echo $line >> "$outfile"
    fi
done < $1 # '$1' is the input file assigned after the script in the terminal

