################################################################################
# Tested versions                                                              #
# Ubuntu 16.04 LTS      KO                                                     #
################################################################################

# First check that some core packages are installed
sudo apt-get -y update
sudo apt-get -y install libglu1-mesa libxi-dev libxmu-dev build-essential gcc toolchain
# sudo apt-get -y install python-pip python-dev python-numpy python-scipy

# I don't know what the fuck I'm doing at this point. Fucking NVIDIA stuff
wget https://developer.nvidia.com/compute/cuda/9.2/Prod/local_installers/cuda-repo-ubuntu1604-9-2-local_9.2.88-1_amd64
wget https://developer.nvidia.com/compute/cuda/9.2/Prod/patches/1/cuda-repo-ubuntu1604-9-2-local-cublas-update-1_1.0-1_amd64
sudo dpkg -i cuda-repo-ubuntu1604-9-2-local_9.2.88-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604-9-2-local-cublas-update-1_1.0-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu1604-9-2-local_9.2.88-1_amd64/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda
export PATH=/usr/local/cuda-9.2/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-9.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
# da fuck are these
sudo systemctl enable nvidia-persistenced
systemctl status nvidia-persistenced

# Install docker
sudo apt-add-repository multiverse
sudo apt update
sudo apt install nvidia-modprobe
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get -y update
sudo apt-get -y install nvidia-docker2
sudo pkill -SIGHUP dockerd