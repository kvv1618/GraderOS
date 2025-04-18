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
make
exec=$(find . -maxdepth 1 -type f -executable | head -n 1)
valgrind --leak-check=full $exec

cp ../tests/user_tests.c .
sed -i 's/^SRCS *= *main\.c/SRCS = user_tests.c/' Makefile
make clean
make
exec=$(find . -maxdepth 1 -type f -executable | head -n 1)
valgrind --leak-check=full $exec

cd ../kernel_space
make clean
make

cd ../user_space
cp ../tests/kernel_tests.c .
sed -i 's/^SRCS *= *user_test\.c/SRCS = kernel_tests.c/' Makefile
make clean
make
exec=$(find . -maxdepth 1 -type f -executable | head -n 1)
valgrind --leak-check=full $exec
