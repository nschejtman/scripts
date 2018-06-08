#!/usr/bin/env bash
sudo add-apt-repository ppa:graphics-drivers
sudo apt-get update
sudo apt-get install nvidia-381
sudo dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda
sudo dpkg -i libcudnn6_6.0.21-1+cuda8.0_amd64.deb
sudo dpkg -i libcudnn6-dev_6.0.21-1+cuda8.0_amd64.deb
sudo dpkg -i libcudnn5_5.1.10-1+cuda8.0_amd64.deb
sudo dpkg -i libcudnn5-dev_5.1.10-1+cuda8.0_amd64.deb 
sudo apt-get install openmpi-bin