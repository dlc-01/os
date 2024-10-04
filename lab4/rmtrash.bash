#!/bin/bash

TRASH_DIR="$HOME/.trash"
LOG_FILE="$HOME/.trash.log"


FILE_TO_REMOVE="$1"


if [ ! -f "$FILE_TO_REMOVE" ]; then
    exit 1
fi


if [ ! -d "$TRASH_DIR" ]; then
    mkdir "$TRASH_DIR"
fi


LINK_NAME=$(ls "$TRASH_DIR" | wc -l)


REAL_PATH=$(realpath "$FILE_TO_REMOVE")

ln "$FILE_TO_REMOVE" "$TRASH_DIR/$LINK_NAME"


rm "$FILE_TO_REMOVE"


echo "$REAL_PATH $LINK_NAME" >> "$LOG_FILE"


