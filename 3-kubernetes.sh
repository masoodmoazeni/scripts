apt-get update
apt install docker.io
systemctl start docker
systemctl enable docker
apt-get install -y curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
cat << EOF > /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubectl kubeadm kubernetes-cni
swappof -a
kubeadm init
