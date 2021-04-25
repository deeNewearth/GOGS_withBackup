#!/bin/sh

current_time=$(date "+%Y.%m.%d-%H.%M.%S")

echo running backup at $current_time

file_name=gogs_archive.$current_time.inprogress

USER=git /app/gogs/gogs backup --target=/data_backup/ --archive-name=$file_name

echo "moving backup"

mv /data_backup/$file_name /data_backup/gogs_archive.$current_time.zip

echo "backup done moved to /data_backup/gogs_archive.$current_time.zip"