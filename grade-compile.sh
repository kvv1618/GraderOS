#!/bin/bash
set -e

sudo rm -rf *5.15* project0*

git config --global user.email varun.kesharaju@gmail.com
git config --global user.name kvv1618

git clone $1
cd project0*
cp ~/GraderOS/given_config.txt .config
make -j$(($(nproc) - 2)) bindeb-pkg

cd ../
sudo dpkg -i *5.15*.deb
