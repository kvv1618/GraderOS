#!/bin/bash
set -e

sudo rm -rf *

git config --global user.email varun.kesharaju@gmail.com
git config --global user.name kvv1618

repo_url="https://github.com/UMBC-CMSC421/project4-$1.git"
git clone "$repo_url"

cd proj*
cd F*
make clean
make all
if [ -f memefs ]; then
    echo "memefs executable present"
else
    echo "memefs executable not present"
fi

make create_dir
make create_memefs_img
make mount_memefs

cd /tmp
stat memefs
cd memefs
# Check if the directory is empty
if [ "$(ls -A .)" ]; then
    echo "Directory is not empty"
else
    echo "Directory is empty"
fi

echo "Creating files in memefs" >> a.txt
ls -la

touch tf1.txt
touch tf2
touch tf1.wav
ls -lhtr
stat tf1.txt
stat tf2
stat tf1.wav

echo "Creating another file in memefs" >> b.txt
echo "Appending more text to file" >> a.txt
cat a.txt
echo "-------------------------------------------------"
cat b.txt

rm tf1.txt
if [ ! -f tf1.txt ]; then
    echo "tf1.txt deleted successfully"
else
    echo "tf1.txt not deleted"
fi
stat b.txt

cd ~/Documents/project4*
cd F*
make unmount_memefs
make mount_memefs
ls /tmp/memefs
make unmount_memefs
