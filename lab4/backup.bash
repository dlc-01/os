#!/bin/bash

SOURCE_DIR="$HOME/source"
BACKUP_DIR="$HOME/Backup-$(date +%Y-%m-%d)"
LOG_FILE="$HOME/backup-report"
DAYS_LIMIT=7

LATEST_BACKUP=$(ls -dt "$HOME"/Backup-* 2>/dev/null | head -n 1)

if [ -n "$LATEST_BACKUP" ] && [ $(($(date +%s) - $(date +%s -r "$LATEST_BACKUP"))) -lt $((DAYS_LIMIT * 86400)) ]; then
    BACKUP_DIR="$LATEST_BACKUP"
else

    mkdir "$BACKUP_DIR"
    echo "Create new dir: $BACKUP_DIR" >> "$LOG_FILE"
fi


for FILE in "$SOURCE_DIR"/*; do
    FILENAME=$(basename "$FILE")
    TARGET_FILE="$BACKUP_DIR/$FILENAME"

    if [ ! -f "$TARGET_FILE" ]; then
        cp "$FILE" "$BACKUP_DIR"
        echo "Coppied  $FILENAME" >> "$LOG_FILE"
    else

        if [ "$(stat -c %s "$FILE")" != "$(stat -c %s "$TARGET_FILE")" ]; then
            mv "$TARGET_FILE" "$TARGET_FILE.$(date +%Y-%m-%d)"
            cp "$FILE" "$BACKUP_DIR"
            echo "Updated version $FILENAME, oldest version rename" >> "$LOG_FILE"
        fi
    fi
done

echo "Done"
