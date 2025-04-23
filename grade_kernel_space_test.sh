#!/bin/bash
set -e

cp ~/GraderOS/kernel_tests.Makefile Makefile
make clean
make
exec=$(find . -maxdepth 1 -type f -executable -printf '%T@ %p\n' | sort -nr | head -n 1 | cut -d' ' -f2-)
$exec
