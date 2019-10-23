#!/bin/bash
mfa_code=$1
user='user'
profile='profile'

echo "Listing MFA devices"
mfa=`aws iam list-mfa-devices --user-name $user | jq -r '.MFADevices[0].SerialNumber'`
echo "Getting STS token"
token=`aws sts get-session-token --duration-seconds 43200 --serial-number $mfa --token-code $mfa_code`

key=`echo $token | jq -r '.Credentials.AccessKeyId'`
secret=`echo $token | jq -r '.Credentials.SecretAccessKey'`
session=`echo $token | jq -r '.Credentials.SessionToken'`

aws configure --profile $profile set aws_access_key_id $key
aws configure --profile $profile set aws_secret_access_key $secret
aws configure --profile $profile set aws_session_token $session

echo "New profile token generated for user $user and profile $profile"
