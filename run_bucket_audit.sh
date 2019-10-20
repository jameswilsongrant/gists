#!/bin/bash
IFS='
'
bucket="${1}"
search_term="AllUsers"

for key in $(aws s3 ls --recursive s3://$bucket/ | awk '{$1=$2=$3=""; print $0}' | sed 's/^[ \t]*//'); do
    #echo ${key}
    acl=$(aws s3api get-object-acl --bucket $bucket --key $key) &&
    result_found=$(echo $acl | grep -q $search_term) &&
    if $result_found; then
        echo $key;
        echo $acl;
    fi;
done
