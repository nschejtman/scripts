#!/usr/bin/env bash
# Install nvidia-docker and nvidia-docker-plugin
sudo apt-add-repository multiverse
sudo apt update
sudo apt install nvidia-modprobe
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb