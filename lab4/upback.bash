#!/bin/bash

RESTORE_DIR="$HOME/restore"
LATEST_BACKUP=$(ls -dt "$HOME"/Backup-* 2>/dev/null | head -n 1)

if [ -z "$LATEST_BACKUP" ]; then
    exit 1
fi


if [ ! -d "$RESTORE_DIR" ]; then
    mkdir "$RESTORE_DIR"
fi


for FILE in "$LATEST_BACKUP"/*; do
    if [[ ! "$FILE" =~ \.[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        cp "$FILE" "$RESTORE_DIR"
    fi
done

echo "File restored in $RESTORE_DIR."
