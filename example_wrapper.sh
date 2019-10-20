#!/bin/bash -x
# nohup /path/to/example_wrapper.sh 2>&1 | logger -t example_wrapper
while [ true ]; do
  date
  runuser -l www-data -s /bin/bash -c 'whoami'
  sleep 1
done
