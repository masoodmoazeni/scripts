VERSION="1.0.2"

#update and upgrade ubuntu and install docker
sh 1-install.sh

#install minikube
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
cp minikube-linux-amd64 /usr/local/bin/minikube
chmod 755 /usr/local/bin/minikube
minikube version -o json

#install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
mv ./kubectl /usr/local/bin/kubectl
chmod 775 /usr/local/bin/kubectl
kubectl version -o json


apt-get install -y conntrack
chmod 777 /tmp/juju-mkc8ab01ad3ea83211c505c81a7ee49a8e3ecb89
sysctl fs.protected_regular=0

#install cri-dockerd
wget https://github.com/Mirantis/cri-dockerd/releases/download/v0.2.0/cri-dockerd-v0.2.0-linux-amd64.tar.gz
tar xvf cri-dockerd-v0.2.0-linux-amd64.tar.gz
mv ./cri-dockerd /usr/local/bin/ 
cri-dockerd --help
wget https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.service
wget https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.socket
mv cri-docker.socket cri-docker.service /etc/systemd/system/
sed -i -e 's,/usr/bin/cri-dockerd,/usr/local/bin/cri-dockerd,' /etc/systemd/system/cri-docker.service
systemctl daemon-reload
systemctl enable cri-docker.service
systemctl enable --now cri-docker.socket

#install cri-tools
wget https://github.com/kubernetes-sigs/cri-tools/releases/download/v1.25.0/crictl-v1.25.0-linux-amd64.tar.gz
tar zxvf crictl-v1.25.0-linux-amd64.tar.gz -C /usr/local/bin

#remove download files
rm -rf cri-dockerd-v0.2.0-linux-amd64.tar.gz
rm -rf crictl-v1.25.0-linux-amd64.tar.gz
rm -rf minikube-linux-amd64

echo "
Install complete.
"
minikube version -o json
kubectl version -o json

minikube start --vm-driver=none
