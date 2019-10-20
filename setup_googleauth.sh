#!/bin/bash -x
lsb_release -a | grep 16.04 || exit
sudo apt-get update
sudo apt-get install libpam-google-authenticator -y || exit
google-authenticator --time-based --force --allow-reuse --window-size 17 --rate-limit 3 --rate-time 30
sudo sed -i -e 's/@include common-auth/#@include common-auth/' /etc/pam.d/sshd
sudo sh -c "echo 'auth required pam_google_authenticator.so nullok' >> /etc/pam.d/sshd"
sudo sed -i -e 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config
sudo sh -c "echo 'AuthenticationMethods publickey,password publickey,keyboard-interactive' >> /etc/ssh/sshd_config"
sudo systemctl restart sshd.service

# Add this to /etc/skel/.bashrc to force set this up on first login
#if [ ! -f ~/.google_authenticator ]; then
#    google-authenticator --time-based --force --allow-reuse --window-size 17 --rate-limit 3 --rate-time 30
#fi
