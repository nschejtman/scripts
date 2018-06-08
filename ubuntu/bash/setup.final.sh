#!/usr/bin/env bash

################################################################################
# Tested versions                                                              #
# Ubuntu 16.04 LTS      ?                                                     #
################################################################################

# Check that some core packages are installed
sudo apt-get -y update
sudo apt-get -y install libglu1-mesa libxi-dev libxmu-dev -y
sudo apt-get -y install build-essential -y

# Get the NVIDIA drivers
sudo dpkg -i cuda-repo-<distro>_<version>_<architecture>.deb
sudo apt-key add /var/cuda-repo-<version>/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda



# Install Docker
sudo apt-get -y update
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common libltdl7 aufs-tools cgroupfs-mount cgroup-lite pigz mountall
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get -y update
sudo apt-get -y install docker-ce

# Install NVIDIA Docker
sudo apt-add-repository multiverse
sudo apt update
sudo apt install nvidia-modprobe

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get -y update
sudo apt-get -y install nvidia-docker2
sudo pkill -SIGHUP dockerd

# Test
sudo docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi
