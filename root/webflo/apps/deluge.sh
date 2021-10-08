#!/usr/bin/with-contenv bash

log () { echo "[$1] [webflo-backup] "$2""; }
log_info () { log "INFO" "$1"; }
log_error () { log "ERROR" "$1"; }

log_info "Starting backup for deluge with pid $$ $(date)"

log_info "create archive for configuration files"
tar -czf /backup/deluge_$(date +"%Y-%m-%d_%H-%M-%S").tar.gz /config/autoadd.conf /config/core.conf /config/web.conf

log_info "keep ${WEBFLO_BACKUP_RETENTION:-20} last backups ..."
ls -1tr /backup/* | head -n -${WEBFLO_RETENTION:-20} | xargs -d '\n' rm -f -- 

log_info "backup done for deluge !"
