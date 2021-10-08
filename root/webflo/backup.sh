#!/usr/bin/with-contenv bash

log () { echo "[$1] [webflo-backup] "$2""; }
log_info () { log "INFO" "$1"; }
log_error () { log "ERROR" "$1"; }


(

flock -n 200 || exit 10

log_info "Running webflo-backup for ${WEBFLO_BACKUP_APP}"

SCRIPT_FILE=/webflo/apps/${WEBFLO_BACKUP_APP}.sh
"$SCRIPT_FILE"

status=$?
[ $status -eq 0 ] && log_info "webflo-backup done successfully !" || log_info "webflo-backup failed"

) 200>/var/lock/webflo-backup.lock