#!/bin/sh

LOG=/tmp/debug_apkg

function log {
    TIME=$(date '+%Y-%m-%d %H:%M:%S')
    [ -f $LOG ] && echo "$TIME [mycron] [$(basename "$0")] $1" >> $LOG
}


# log entry
log "Script called: $0 $@"

NAS_PROG="/shares/Volume_1/Nas_Prog"
