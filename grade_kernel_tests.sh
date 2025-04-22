#!/bin/bash
set -e

cd project2*
cd user_space
cp ../tests/kernel_tests.c .
bash ~/GraderOS/grade_kernel_space_test.sh
