#!/bin/bash -x
BACKUP_TARGET=~/
BACKUP_HOST=hostname
BACKUP_TAG=tag

ssh ${BACKUP_HOST} "mv ~/backup_${BACKUP_TAG}_primary.tar ~/backup_${BACKUP_TAG}_secondary.tar"
tar -cf - ${BACKUP_TARGET} 2> /dev/null | pv -trb | ssh ${BACKUP_HOST} "cat > ~/backup_${BACKUP_TAG}_primary.tar"
ssh ${BACKUP_HOST} "du -hsc ~/backup_${BACKUP_TAG}_*"
ssh ${BACKUP_HOST} "date > ~/backup_${BACKUP_TAG}_done.txt"
