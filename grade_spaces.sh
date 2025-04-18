#!/bin/bash
set -e

cd ../
make clean
cp ~/GraderOS/given_config.txt .config
make -j$(($(nproc) - 2)) bindeb-pkg

cd user_space
cp ../tests/kernel_tests.c .
./grade_kernel_space_test.sh
