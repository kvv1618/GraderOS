#!/bin/bash
set -e

cp ~/GraderOS/user_tests.Makefile Makefile
make clean
make
exec=$(find . -maxdepth 1 -type f -executable | head -n 1)
valgrind --leak-check=full $exec
