################################################################################
# Tested versions                                                              #
# Ubuntu 16.04 LTS      OK                                                     #
################################################################################

# Create a handling directory for the process
mkdir ~/TensorFlow_GPU_Setup_Dir
cd ~/TensorFlow_GPU_Setup_Dir

# First check that some core packages are installed
sudo apt-get -y update
sudo apt-get -y install libglu1-mesa libxi-dev libxmu-dev -y
sudo apt-get -y install build-essential -y
sudo apt-get -y install python-pip python-dev -y
sudo apt-get -y install python-numpy python-scipy –y

# Then get the NVIDIA drivers
wget http://us.download.nvidia.com/XFree86/Linux-x86_64/367.44/NVIDIA-Linux-x86_64-367.44.run
sudo chmod +x NVIDIA-Linux-x86_64-367.44.run
sudo ./NVIDIA-Linux-x86_64-367.44.run -silent

# Check the driver was intstalled correclty
nvidia-smi

# Install CUDA 9.0
# wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_9.0.176_384.81_linux-run
# sudo chmod +x cuda_9.0.176_384.81_linux-run
# sudo ./cuda_9.0.176_384.81_linux-run --driver -silent
# sudo ./cuda_9.0.176_384.81_linux-run --toolkit -silent
# sudo ./cuda_9.0.176_384.81_linux-run --samples –silent
#
# # Install CUDA 9.0 patches
# # wget https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/1/cuda_9.0.176.1_linux-run
# # wget https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/2/cuda_9.0.176.2_linux-run
# # sudo chmod +x cuda_9.0.176.1_linux-run
# # sudo chmod +x cuda_9.0.176.2_linux-run
# # sudo ./cuda_9.0.176.1_linux-run
# # sudo ./cuda_9.0.176.2_linux-run
#
#
# echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"' >> ~/.bashrc
# echo 'export CUDA_HOME=/usr/local/cuda' >> ~/.bashrc
# source ~/.bashrc
#
# # Install CUDNN V5.1+
# wget http://developer.download.nvidia.com/compute/redist/cudnn/v6.0/cudnn-8.0-linux-x64-v6.0.tgz
# tar –xvzf cudnn-8.0-linux-x64-v6.0.tgz
# sudo cp -r -P cuda/lib64 /usr/local/cuda
# sudo cp cuda/include/cudnn.h /usr/local/cuda/include/
#
# # Install LIBCUPTI-DEV library for CUDA profiling
# sudo apt-get -y install libcupti-dev

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
sudo systemctl status docker

# Install NVIDIA docker
wget https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
sudo dpkg -i nvidia-docker*.deb
# If that fails try the running the following commands
# sudo apt-get install nvidia-modprobe
# sudo nvidia-docker-plugin &

# Try out
sudo nvidia-docker run --rm nvidia/cuda nvidia-smi

# Install Tensorflow
# sudo apt-get -y install python3-pip
# pip3 install tensorflow
# pip3 install tensorflow-gpu
