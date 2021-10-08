#!/usr/bin/with-contenv bash

log () { echo "[$1] [webflo-backup] "$2""; }
log_info () { log "INFO" "$1"; }
log_error () { log "ERROR" "$1"; }

log_info "Starting backup for nzbhydra2 with pid $$ $(date)"


log_info "backup done for nzbhydra2 !"
