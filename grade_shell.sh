#!/bin/bash
set -e

cd ~/Documents
sudo rm -rf ~/Documents/*

git config --global user.email varun.kesharaju@gmail.com
git config --global user.name kvv1618

git clone $1
cd project1*
make clean
make

exec_file=$(find . -maxdepth 1 -type f -executable | head -n 1)
$exec_file

abcd
ls
pwd
