#!/bin/bash

while true
do
    read LINE
    echo "$LINE" > pipe
    if [[ "$LINE" == "QUIT" ]]; then
        exit 0
    fi
done
