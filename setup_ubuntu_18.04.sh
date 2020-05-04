#!/bin/bash

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

# download compiled binaries
wget https://download.01.org/intel-sgx/sgx-linux/2.8/distro/ubuntu18.04-server/sgx_linux_x64_driver_2.6.0_51c4821.bin
wget https://download.01.org/intel-sgx/sgx-linux/2.8/distro/ubuntu18.04-server/sgx_linux_x64_sdk_2.8.100.3.bin