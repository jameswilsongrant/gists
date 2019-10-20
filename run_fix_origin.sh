#!/bin/bash -x 
ORIGIN=$(git remote get-url origin | sed -e 's/https\:\/\/github.com\//git@github.com:/g')
git remote remove origin
git remote add origin ${ORIGIN}
