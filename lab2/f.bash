#!/bin/bash

max_rss=0
max_pid=0
max_name=""

for pid in $(ls /proc | grep -E '^[0-9]+$'); do
  status_file="/proc/$pid/status"
  if [ -r "$status_file" ]; then
    VmRSS=$(grep "VmRSS:" "$status_file" | awk '{print $2}')
    if [ -n "$VmRSS" ] && [ "$VmRSS" -gt "$max_rss" ]; then
      max_rss=$VmRSS
      max_pid=$pid
      max_name=$(grep "^Name:" "$status_file" | awk '{print $2}')
    fi
  fi
done

echo "Process with max memory usage:"
echo "PID: $max_pid"
echo "Name: $max_name"
echo "VmRSS: $max_rss kB"


echo -e "\nTop command output:"
top -b -o +%MEM | head -n 12
