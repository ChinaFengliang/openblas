#!/bin/bash

cd OpenBLAS-0.2.18
cd benchmark

export OPENBLAS_NUM_THREADS=1
echo "1 threads"
taskset -c 0 ./sgemm.goto 200 4000 200

export OPENBLAS_NUM_THREADS=10
echo "10 threads"
taskset -c 0-9 ./sgemm.goto 200 4000 200

export OPENBLAS_NUM_THREADS=32
echo "32 threads"
taskset -c 0-31 ./sgemm.goto 200 4000 200

export OPENBLAS_NUM_THREADS=64
echo "64 threads"
taskset -c 0-63 ./sgemm.goto 200 4000 200

