#!/bin/bash

inotifywait -m -e close_write --format "%f" /home/jovyan/import | while read FILE
do
    if [ "${FILE##*.}" == "zip" ]; then
        DB_NAME="${FILE%.sql.zip}"
        mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME"
        unzip -p "/home/jovyan/import/$FILE" | mysql -u root "$DB_NAME"
        rm "/home/jovyan/import/$FILE"
    fi
done
