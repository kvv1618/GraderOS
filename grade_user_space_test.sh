#!/bin/bash
set -e

cd project2*
cd user_space
cp ~/GraderOS/user_tests.Makefile Makefile
make clean
make
exec=$(find . -maxdepth 1 -type f -executable -printf '%T@ %p\n' | sort -nr | head -n 1 | cut -d' ' -f2-)
valgrind --leak-check=full $exec
