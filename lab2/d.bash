#!/bin/bash

output_file="cpu_burst_info.txt"

> "$output_file"

for pid in $(ls /proc | grep '^[0-9]\+$'); do
    status_file="/proc/$pid/status"
    sched_file="/proc/$pid/sched"
    if [ -r "$status_file" ] &&  [ -r "$sched_file" ]; then

        ppid=$(grep "PPid:" "$status_file" | awk '{print $2}')
        sum_exec_runtime=$(grep "sum_exec_runtime" "$sched_file" | awk '{print $3}')
        nr_switches=$(grep "nr_switches" "$sched_file" | awk '{print $3}')

        if [[ $nr_switches -ne 0 ]]; then
            art=$(echo "scale=6; $sum_exec_runtime / $nr_switches" | bc)
            echo "$pid : $ppid : $art" >> "$output_file"
        fi
    fi
done

sort -t ':' -k2 -n "$output_file" -o "$output_file"

sed -i 's/\(.*\) : \(.*\) : \(.*\)/ProcessID=\1 : Parent_ProcessID=\2 : Average_Running_Time=\3/' "$output_file"
