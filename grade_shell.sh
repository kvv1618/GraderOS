#!/bin/bash
set -e

cd ~/Documents
sudo rm -rf ~/Documents/*

git config --global user.email varun.kesharaju@gmail.com
git config --global user.name kvv1618

repo_url="https://github.com/UMBC-CMSC421/project1-$1.git"
git clone "$repo_url"
cd project1*
make clean
make

exec_file=$(find . -maxdepth 1 -type f -executable | head -n 1)
valgrind --leak-check=full $exec_file
echo $?
