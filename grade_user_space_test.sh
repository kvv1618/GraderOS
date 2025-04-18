#!/bin/bash
set -e

cd project2*
cd user_space
cp ~/GraderOS/user_tests.Makefile Makefile
make clean
make
exec=$(find . -maxdepth 1 -type f -executable | head -n 1)
valgrind --leak-check=full $exec
