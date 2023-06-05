#!/bin/sh

LOG=/tmp/debug_apkg

function log {
    TIME=$(date '+%Y-%m-%d %H:%M:%S')
    [ -f $LOG ] && echo "$TIME [mycron] [$(basename "$0")] $1" >> $LOG
}

# log entry
log "Script called: $0 $@"

# recover original crontab
log "recover original crontab from before install"
crontab "$1"/crontab.orig

# remove app directory
path=$1
log "remove app path \"$path\""
rm -rf "$path"


# remove web directory
webdir="/var/www/apps/mycron"
log "remove web path \"$webdir\""
rm -rf $webdir
# if CenterType is "1" (embedded), then the path will be /var/www/apps/<appname>
# if it is "0", then the path will be /var/www/<appname>

# remove user
deluser www-data