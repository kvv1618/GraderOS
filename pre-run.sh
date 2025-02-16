#!/bin/bash
set -e

sudo apt update -y
sudo apt upgrade -y
sudo apt-get -y install build-essential valgrind nano patch diffutils curl fakeroot git pkg-config gedit libssl-dev libncurses5-dev libelf-dev bison flex bc dkms rsync clang-format dwarves qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools
sudo apt install -y vim htop

git config --global user.email varun.kesharaju@gmail.com
git config --global user.name kvv1618

git clone https://github.com/kvv1618/GraderOS.git

sudo chmod -R 777 /usr/src
cd /usr/src
git clone https://github.com/UMBC-CMSC421/linux.git project0

cd project0
cp ~/GraderOS/working-config.txt .config
make mrproper
make -j$(($(nproc) - 2)) bindeb-pkg
