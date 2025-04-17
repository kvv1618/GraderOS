#!/bin/bash
set -e

cd ~/Documents
sudo rm -rf ~/Documents/*

git config --global user.email varun.kesharaju@gmail.com
git config --global user.name kvv1618

repo_url="https://github.com/UMBC-CMSC421/project2-$1.git"
git clone "$repo_url"
cd project2*

cd user_space
make clean

user_space_test_exec=$(find . -maxdepth 1 -type f -executable | head -n 1)

make
valgrind --leak-check=full ./main

valgrind --leak-check=full $user_space_test_exec

cd ..
make clean
make
cd kernel-space
gcc -o  kernel_test kernel_test.c
valgrind --leak-check=full ./kernel_test
