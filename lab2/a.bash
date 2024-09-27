#!/bin/bash

user="user"


process_count=$(ps -u "$user" --no-headers | wc -l)
echo "$process_count" > process_count.txt


ps -u "$user" -o pid,comm --no-headers | awk '{print $1 ":" $2}' >> process_count.txt
