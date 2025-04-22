#!/bin/bash
set -e

cd project2*
make clean
cp ~/GraderOS/given_config.txt .config
make -j$(($(nproc) - 2)) bindeb-pkg
cd ../
sudo dpkg -i *5.15*.deb
