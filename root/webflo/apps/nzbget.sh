#!/usr/bin/with-contenv bash

log () { echo "[$1] [webflo-backup] "$2""; }
log_info () { log "INFO" "$1"; }
log_error () { log "ERROR" "$1"; }

log_info "Starting backup for nzbget with pid $$ $(date)"

log_info "copy configuration files"
cp /config/nzbget.conf /backup/nzbget-$(date +"%Y-%m-%d_%H-%M-%S").conf

log_info "keep ${WEBFLO_BACKUP_RETENTION:-20} last backups ..."
ls -1tr /backup/* | head -n -${WEBFLO_RETENTION:-20} | xargs -d '\n' rm -f -- 

log_info "backup done for nzbget !"
