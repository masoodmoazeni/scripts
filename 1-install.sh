VERSION="1.0.1"
mkdir ~/solution
cd ~/solution/

cat << EOF > ~/solution/sources.list
deb http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse

deb http://archive.canonical.com/ubuntu focal partner
deb-src http://archive.canonical.com/ubuntu focal partner
EOF

sudo rm /etc/apt/sources.list
sudo cp ~/solution/sources.list /etc/apt/sources.list
sudo mv /etc/apt/sources.list.d/* ~/solution
sudo apt update
sudo apt install docker.io -y
sudo apt install docker-compose -y

echo "
Install complete.
"
docker --version
docker-compose --version
