#!/bin/bash 
DISK=disk2

function pause(){
   read -p "$*"
}
pause "Are you sure? This command is going to wipe /dev/${DISK} Press enter..."
for x in 1 2 3; do 
    echo "pass ${x}"
    time dd if=/dev/urandom of=/dev/${DISK} bs=512k
done
