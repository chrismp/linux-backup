#!/bin/bash
NOW=$(date +"%Y-%m-%d-%H%M%S")
FILE="backup.$NOW.tar.gz"
BACKUP_DIRECTORY="/media/chris/Seagate Expansion Drive/DebianBackups"

# $BACKUP_DIRECTORY must be in double quotes since part of it's path has spaces
# i.e., Seagate Expansion Drive
mkdir -p "$BACKUP_DIRECTORY" 
#rsync -aitvz ./* "$BACKUP_DIRECTORY/$FILE"

# https://help.ubuntu.com/community/BackupYourSystem/TAR
# http://superuser.com/questions/438450/which-files-do-i-need-to-backup-to-keep-my-linux-user-settings
# http://unix.stackexchange.com/questions/1067/what-directories-do-i-need-to-back-up
# leaving out -v from tar to reduce output so backup runs faster
tar -cpzf "$BACKUP_DIRECTORY/$FILE" /etc /home /root /usr/local /usr/share /home /var

# Extraction
# http://stackoverflow.com/questions/13707429/decompress-gzip-file-to-specific-directory
# tar fvxz /PATH/TO/backup.tar.gz -C /PATH/TO/EXTRACTION