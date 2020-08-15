#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2020-08-14 13:16:04 +0100 (Fri, 14 Aug 2020)
#
#  https://github.com/harisekhon/bash-tools
#
#  License: see accompanying Hari Sekhon LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/in/harisekhon
#

mkdir -pv /vagrant/logs

{

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

bash_tools="/bash-tools"

# shellcheck disable=SC1090
source "$bash_tools/lib/utils.sh"

section "Running Vagrant Shell Provisioner Script - Kube1"

pushd /vagrant

# should already be in the vagrant dir
if ! [ -f calico.yaml ]; then
    timestamp "fetching calico.yaml"
    wget https://docs.projectcalico.org/manifests/calico.yaml
fi

echo >&2

timestamp "bootstrapping kubernetes master"
# kubeadm-config.yml is in vagrant dir mounted at /vagrant
kubeadm init --node-name "$(hostname -f)" --config=kubeadm-config.yaml --upload-certs | tee kubeadm-init.out # save output for review

echo >&2

kubeadm token list

timestamp "configuring kubectl"
mkdir -pv ~/.kube /vagrant/.kube
cp -i /etc/kubernetes/admin.conf ~/.kube/config
chown "$(id -u):$(id -g)" ~/.kube/config
cp ~/.kube/config /vagrant/.kube/config

timestamp "applying calico.yaml"
kubectl apply -f calico.yaml

timestamp "K8S Nodes:"
kubectl get nodes

echo >&2

kubectl taint nodes --all node-role.kubernetes.io/master-

echo >&2

kubectl get nodes

echo >&2

kubectl taint nodes --all node.kubernetes.io/not-ready-

echo >&2

kubectl get nodes

echo >&2

/bash-tools/k8s_join_cmd.sh > /vagrant/k8s_join.sh

} 2>&1 | tee -a /vagrant/logs/provision-kube1.log
