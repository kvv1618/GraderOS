#!/bin/bash

set -e

cd ~/Documents/project1*
exec_file=$(find . -maxdepth 1 -type f -executable | head -n 1)
valgrind --leak-check=full $exec_file
echo $?
