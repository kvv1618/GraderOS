#!/bin/bash
set -e

sudo rm -rf *

git config --global user.email varun.kesharaju@gmail.com
git config --global user.name kvv1618

repo_url="https://github.com/UMBC-CMSC421/project2-$1.git"
git clone "$repo_url"
cd project2*

cd user_space
make clean
make
exec=$(find . -maxdepth 1 -type f -executable -printf '%T@ %p\n' | sort -nr | head -n 1 | cut -d' ' -f2-)
valgrind --leak-check=full $exec
