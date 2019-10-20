#!/bin/bash -x
apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl
systemctl daemon-reload
systemctl restart kubelet
echo "https://kubernetes.io/docs/setup/independent/install-kubeadm/"
echo "disable any swap instances in /etc/fstab"
swapoff --all

# Join instructions are in the output.
# Tokens expire after 24 hours. You can create new ones with this command
# kubeadm token create
kubeadm init --pod-network-cidr=192.168.0.0/16 2>&1 | tee kube_output

# You would repeat these commands to allow another local user to talk to kubernetes
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
# This can also work
# export KUBECONFIG=/etc/kubernetes/admin.conf

# Calico networking, these files are also in the gists repo
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

# This lets you run a one node cluster
kubectl taint nodes --all node-role.kubernetes.io/master-