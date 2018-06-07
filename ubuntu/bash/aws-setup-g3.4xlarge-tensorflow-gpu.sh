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

# Install CUDA 8 TODO
# wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
# sudo chmod +x cuda_8.0.61_375.26_linux-run
# sudo ./cuda_8.0.61_375.26_linux-run --driver -silent
# sudo ./cuda_8.0.61_375.26_linux-run --toolkit -silent
# sudo ./cuda_8.0.61_375.26_linux-run --samples –silent

# echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"' >> ~/.bashrc
# echo 'export CUDA_HOME=/usr/local/cuda' >> ~/.bashrc
# source ~/.bashrc

# Install CUDA 9
sudo apt-get -y install cuda-9-0
sudo cuda-9-0 --driver -silent
sudo cuda-9-0 --toolkit -silent
sudo cuda-9-0 --samples –silent

# Install CUDNN V5.1+
wget http://developer.download.nvidia.com/compute/redist/cudnn/v6.0/cudnn-8.0-linux-x64-v6.0.tgz
tar –xvzf cudnn-8.0-linux-x64-v6.0.tgz
sudo cp -r -P cuda/lib64 /usr/local/cuda
sudo cp cuda/include/cudnn.h /usr/local/cuda/include/

# Install LIBCUPTI-DEV library for CUDA profiling
sudo apt-get -y install libcupti-dev

# Install Tensorflow
sudo apt-get -y install python3-pip
pip3 install tensorflow
pip3 install tensorflow-gpu
