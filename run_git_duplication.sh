#!/bin/bash -x
# Put your list of source repositories in a 'list' file
# You need to precreate all your repos
SOURCE=git@git.source.com:port/path/
DEST=git@github.com/user/
START_DIR=$(pwd)

IFS='
'

for PROPERTY in $(cat list); do
  rm -rfv ${PROPERTY}.git
  git clone --bare ssh://${SOURCE}/${PROPERTY}.git && cd ${PROPERTY}.git && git push --mirror ${DEST}/${PROPERTY}.git
  cd ${START_DIR}
done
