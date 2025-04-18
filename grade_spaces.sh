#!/bin/bash
set -e

cd project2*
make clean
cp ~/GraderOS/given_config.txt .config
make -j$(($(nproc) - 2)) bindeb-pkg

cd user_space
cp ../tests/kernel_tests.c .
bash ~/GraderOS/grade_kernel_space_test.sh
