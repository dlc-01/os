#!/bin/bash

VALUE=1
MODE="addition"

trap 'MODE="addition"' USR1
trap 'MODE="multiplication"' USR2
trap 'echo "Terminated by signal from another process"; exit' SIGTERM

while true
do
    sleep 1
    case "$MODE" in
        "addition")
            VALUE=$((VALUE + 2))
            ;;
        "multiplication")
            VALUE=$((VALUE * 2))
            ;;
    esac
    echo "Current value: $VALUE"
done
