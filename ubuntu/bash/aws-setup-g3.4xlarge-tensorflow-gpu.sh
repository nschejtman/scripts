# First check that some core packages are installed
sudo apt-get -y update
sudo apt-get -y install libglu1-mesa libxi-dev libxmu-dev -y
sudo apt-get -y install build-essential -y
sudo apt-get -y install python-pip python-dev -y
sudo apt-get -y install python-numpy python-scipy –y

# Then get the NVIDIA drivers
wget http://us.download.nvidia.com/XFree86/Linux-x86_64/367.44/NVIDIA-Linux-x86_64-367.44.run
sudo chmod +x NVIDIA-Linux-x86_64-367.44.run
sudo ./NVIDIA-Linux-x86_64-367.44.run --silent

# Check the driver was intstalled correclty
nvidia-smi

# Install CUDA
wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
sudo chmod +x cuda_8.0.61_375.26_linux-run
sudo ./cuda_8.0.61_375.26_linux-run --driver --silent
sudo ./cuda_8.0.61_375.26_linux-run --toolkit --silent
sudo ./cuda_8.0.61_375.26_linux-run --samples –silent
