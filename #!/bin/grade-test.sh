#!/bin/bash
set -e

cp ~/GraderOS/test.c .
gcc test.c -o test
./test
sudo dmesg
