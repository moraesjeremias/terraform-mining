#!/bin/bash
sudo su
sudo echo "alias ls='ls -lash'" >> /home/ubuntu/.bashrc
mkdir /home/ubuntu/downloads
sudo killall apt-get dpkg
sudo dpkg --configure -a
sudo apt-get -y update
sudo apt-get -y install freeglut3-dev libx11-dev libxmu-dev libxi-dev libgl1-mesa-glx libglu1-mesa libglu1-mesa-dev gcc make libcurl4-openssl-dev autoconf git screen libncurses5-dev opencl-headers build-essential protobuf-compiler libprotoc-dev libboost-all-dev libleveldb-dev hdf5-tools libhdf5-dev libopencv-core-dev libopencv-highgui-dev libsnappy-dev libsnappy1v5 libatlas-base-dev cmake libstdc++6 libgoogle-glog0v5 libgoogle-glog-dev libgflags-dev liblmdb-dev python3-pip gfortran libjansson-dev uthash-dev autogen libtool pkg-config httpie
source /home/ubuntu/.bashrc
sudo killall dpkg
sudo dpkg --configure -a
sudo http -v -d https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin -o /home/ubuntu/downloads/cuda-ubuntu2004.pin
sudo mv /home/ubuntu/downloads/cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo http -v -d https://github.com/NebuTech/NBMiner/releases/download/v37.1/NBMiner_37.1_Linux.tgz -o /home/ubuntu/downloads/NBMiner_37.1_Linux.tgz
sudo tar -xf /home/ubuntu/downloads/NBMiner_37.1_Linux.tgz --directory=/home/ubuntu/downloads
echo "./nbminer -a ethash -o stratum+tcp://ethash.poolbinance.com:443 -u ethminingaws.001 -log" > /home/ubuntu/downloads/NBMiner_Linux/start_eth.sh
sudo http -v -d https://developer.download.nvidia.com/compute/cuda/11.3.0/local_installers/cuda-repo-ubuntu2004-11-3-local_11.3.0-465.19.01-1_amd64.deb -o /home/ubuntu/downloads/cuda-repo-ubuntu2004-11-3-local_11.3.0-465.19.01-1_amd64.deb
sudo dpkg -i /home/ubuntu/downloads/cuda-repo-ubuntu2004-11-3-local_11.3.0-465.19.01-1_amd64.deb
cd /home/ubuntu/downloads
sudo apt-key add /var/cuda-repo-ubuntu2004-11-3-local/7fa2af80.pub
sudo apt-get -y update
sudo apt-get -y install cuda
sudo apt -y install ubuntu-drivers-common
sudo ubuntu-drivers autoinstall
sudo apt-get -y upgrade
echo "Worked Muchachos" 