#!/bin/bash

MODE="addition"
VALUE=1

while true
do
    if read LINE < pipe; then
        case "$LINE" in
            "+")
                MODE="addition"
                ;;
            "*")
                MODE="multiplication"
                ;;
            "QUIT")
                echo "Planned stop"
                killall generator.sh
                exit
                ;;
            [0-9]*)
                NUMBER="$LINE"
                if [[ "$MODE" == "addition" ]]; then
                    VALUE=$((VALUE + NUMBER))
                else
                    VALUE=$((VALUE * NUMBER))
                fi
                echo "Current value: $VALUE"
                ;;
            *)
                echo "Input data error"
                killall generator.sh
                exit 1
                ;;
        esac
    fi
done
