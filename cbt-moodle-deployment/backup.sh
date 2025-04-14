#!/bin/bash

DATE=$(date +%Y-%m-%d_%H-%M)
BACKUP_DIR="backups/backup_$DATE"
mkdir -p $BACKUP_DIR

echo "Ì≥Å Backing up DB and Moodle data..."
cp -r db-data $BACKUP_DIR/
docker run --rm --volumes-from moodle_web -v $(pwd):/backup busybox tar czf /backup/$BACKUP_DIR/moodle-data.tar.gz /var/www/html

echo "‚úÖ Backup complete: $BACKUP_DIR"
