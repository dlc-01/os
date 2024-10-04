#!/bin/bash

TRASH_DIR="$HOME/.trash"
LOG_FILE="$HOME/.trash.log"


FILE_TO_RESTORE="$1"


grep "$FILE_TO_RESTORE" "$LOG_FILE" | while read -r line; do
    ORIGINAL_PATH=$(echo "$line" | cut -d ' ' -f1)
    LINK_NAME=$(echo "$line" | cut -d ' ' -f2)

    echo "Restore $ORIGINAL_PATH? (y/n)"
    read -r CONFIRM
    if [ "$CONFIRM" = "y" ]; then

        if [ -d "$(dirname "$ORIGINAL_PATH")" ]; then
            ln "$TRASH_DIR/$LINK_NAME" "$ORIGINAL_PATH"
        else
            ln "$TRASH_DIR/$LINK_NAME" "$HOME/$(basename "$ORIGINAL_PATH")"
            echo "Not exist."
        fi


        rm "$TRASH_DIR/$LINK_NAME"
        sed -i "\|$line|d" "$LOG_FILE"
        exit 0
    fi
done

