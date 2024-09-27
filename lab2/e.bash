#!/bin/bash

input_file="cpu_burst_info.txt"
output_file="avarage_cpu_burst_info.txt"


> "$output_file"

prev_ppid=""
sum_art=0
count=0

while read line; do

    pid=$(echo "$line" | grep -oE 'ProcessID=[0-9]+' | cut -d'=' -f2)
    ppid=$(echo "$line" | grep -oE 'Parent_ProcessID=[0-9]+' | cut -d'=' -f2)
    art=$(echo "$line" | grep -oE 'Average_Running_Time=[0-9.]+' | cut -d'=' -f2)



    if [ -n "$prev_ppid" ] && [ "$ppid" != "$prev_ppid" ]; then

        avg=$(echo "scale=5; $sum_art / $count" | bc)
        echo "Average_Running_Children_of_ParentID=$prev_ppid is $avg" >> "$output_file"
        echo "" >> "$output_file"


        sum_art=0
        count=0
    fi


    echo "$line" >> "$output_file"


    sum_art=$(echo "$sum_art + $art" | bc)
    count=$((count + 1))

    prev_ppid="$ppid"

done < "$input_file"


if [ "$count" -gt 0 ]; then
    avg=$(echo "scale=5; $sum_art / $count" | bc)
    echo "Average_Running_Children_of_ParentID=$prev_ppid is $avg" >> "$output_file"
fi

