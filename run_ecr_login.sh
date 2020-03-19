#!/bin/bash -x
# AWS broke this for... reasons? Whatever, this is the working command. Update for your region/profile name
$(aws --region us-west-2 --profile default_sts ecr get-login | sed -e 's/-e none//')
