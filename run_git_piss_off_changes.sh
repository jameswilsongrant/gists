#!/bin/bash -x
# This shouldn't be this hard
git checkout .
git clean -f 
git reset --hard
git stash -u
