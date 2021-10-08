#!/usr/bin/with-contenv bash

log () { echo "[$1] [webflo-backup] "$2""; }
log_info () { log "INFO" "$1"; }
log_error () { log "ERROR" "$1"; }

log_info "Starting backup for Emby with pid $$ $(date)"

log_info "Compress emby-generated backup folder"
for item in /backup/emby/*; do
  if [ -d "$item" ]; then
    file=${item// /_}.tar.gz
    tar -czf "$file" "$item"
    chown abc:abc $file
    chmod 600 $file
    rm -rf "$item"
  fi
done


log_info "backup done for nzbget !"
