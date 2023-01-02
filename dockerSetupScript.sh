#!bin/bash

# installing docker

apt-get remove docker docker-engine docker.io containerd runc
apt-get update
apt-get install
apt-get ca-certificates
apt-get curl
apt-get gnupg
apt-get lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
docker run hello-world
usermod -aG docker slahlou
