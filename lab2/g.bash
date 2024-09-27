#!/bin/bash

for pid in $(ls /proc | grep -E '^[0-9]+$'); do
  io_file="/proc/$pid/io"
  if [ -r "$io_file" ]; then
    read_bytes=$(grep "read_bytes:" "$io_file" | awk '{print $2}')
    if [ -n "$read_bytes" ]; then
      echo "$pid $read_bytes" >> /tmp/read_bytes_t0.txt
    fi
  fi
done


sleep 60


while read -r line; do
  pid=$(echo $line | awk '{print $1}')
  read_bytes_t0=$(echo $line | awk '{print $2}')

  io_file="/proc/$pid/io"
  if [ -r "$io_file" ]; then
    read_bytes=$(grep "read_bytes:" "$io_file" | awk '{print $2}')
    if [ -n "$read_bytes" ]; then
      delta=$((read_bytes - read_bytes_t0))
      echo "$delta $pid" >> /tmp/delta_read_bytes.txt
    fi
  fi
done < /tmp/read_bytes_t0.txt


top_pids=$(sort -nr /tmp/delta_read_bytes.txt | head -n 3 | awk '{print $2}')


echo "Top 3 processes by read bytes in the last minute:"
for pid in $top_pids; do
  cmdline_file="/proc/$pid/cmdline"
  if [ -r "$cmdline_file" ]; then
    cmdline=$(tr '\0' ' ' < "$cmdline_file")
    delta=$(grep "$pid" /tmp/delta_read_bytes.txt | awk '{print $1}')
    echo "$pid:$cmdline:$delta"
  fi
done

rm /tmp/read_bytes_t0.txt /tmp/delta_read_bytes.txt
