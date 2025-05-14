#!/bin/bash
set -e

sudo rm -rf *

git config --global user.email varun.kesharaju@gmail.com
git config --global user.name kvv1618

repo_url="https://github.com/UMBC-CMSC421/project2-$1.git"
git clone "$repo_url"

cd Fuse*
make clean
make all
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

touch test_file.txt
touch test_file2
touch test_file.wav
ls -l
stat test_file.txt
stat test_file2
stat test_file.wav

echo "Creating another file in memefs" >> b.txt
echo "Appending more text to file" >> a.txt
cat a.txt
cat b.txt

rm test_file.txt
if [ ! -f test_file.txt ]; then
    echo "test_file.txt deleted successfully"
else
    echo "test_file.txt not deleted"
fi
stat b.txt

cd ~/Documents/project4*
make unmount_memefs
make mount_memefs

cd /tmp/memefs
ls -l
