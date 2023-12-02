#!/bin/bash

IMPORT_DIR=/home/jovyan/import

function load_zip_file() {
    FILE="$1"
    DB_NAME="${FILE%.sql.zip}"

    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME"
    unzip -p "$IMPORT_DIR/$FILE" | mysql -u root "$DB_NAME"
    rm "/home/jovyan/import/$FILE"
}
sleep 5

if [ -n "$DEFAULT_SQL_DUMP" ]; then
    wget -P "$IMPORT_DIR" "$DEFAULT_SQL_DUMP" || :
fi

for FILE in "$IMPORT_DIR"/*.zip; do
    if [ -e "$FILE" ]; then
        load_zip_file "$(basename "$FILE")"
    fi
done

inotifywait -m -e close_write --format "%f" "$IMPORT_DIR" | while read FILE
do
    if [ "${FILE##*.}" == "zip" ]; then
        load_zip_file "$FILE" || :
    fi
done
