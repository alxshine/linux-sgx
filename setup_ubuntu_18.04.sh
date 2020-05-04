#!/bin/bash

# configuration variables
dbg=0

# SDK prerequisites
sudo apt-get install \
    build-essential\
    ocaml\
    ocamlbuild\
    automake\
    autoconf\
    libtool\
    wget\
    python\
    libssl-dev\
    git

# PSW prerequisites
sudo apt-get install\
    libssl-dev\
    libcurl4-openssl-dev\
    protobuf-compiler\
    libprotobuf-dev\
    debhelper\
    cmake\
    reprepro

# download and install driver
wget https://download.01.org/intel-sgx/sgx-linux/2.8/distro/ubuntu18.04-server/sgx_linux_x64_driver_2.6.0_51c4821.bin
# TODO: add SHA-256 of driver binary
sudo bash ./sgx_linux_x64_driver_2.6.0_51c4821.bin

# download prebuilt binaries
./download_prebuilt.sh

# build and install SDK
make sdk DEBUG=$dbg
make sdk_install_pkg DEBUG=$dbg
bash linux/installer/bin/sgx_linux_x64_sdk_2.8.100.3.bin -prefix ~
echo 'source ~/sgxsdk/environment' >> ~/.bashrc
source ~/sgxsdk/environment

# build PSW and .deb files
make psw DEBUG=$dbg
make deb_psw_pkg DEBUG=$dbg

sudo dpkg -i linux/installer/deb/**/*.deb