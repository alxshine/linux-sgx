#!/bin/bash

# SDK prerequisites
sudo apt-get install -y \
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
sudo apt-get install -y \
    libssl-dev\
    libcurl4-openssl-dev\
    protobuf-compiler\
    libprotobuf-dev\
    debhelper\
    cmake\
    reprepro

# download and install driver
git submodule update --init --recursive
(cd driver && ./install-ubuntu.sh)

# download prebuilt binaries
./download_prebuilt.sh

# build and install SDK
make sdk
make sdk_install_pkg
bash linux/installer/bin/sgx_linux_x64_sdk_2.8.100.3.bin -prefix ~
echo 'source ~/sgxsdk/environment' >> ~/.bashrc
source ~/sgxsdk/environment

# build PSW and .deb files
make psw
make deb_psw_pkg

sudo dpkg -i linux/installer/deb/**/*.deb