#!/bin/bash

cd OpenBLAS-0.2.18
cd benchmark

export OPENBLAS_NUM_THREADS=1
taskset -c 0 ./sgemm.goto 200 4000 200

export OPENBLAS_NUM_THREADS=10
taskset -c 0-9 ./sgemm.goto 200 4000 200

export OPENBLAS_NUM_THREADS=32
taskset -c 0-31 ./sgemm.goto 200 4000 200

export OPENBLAS_NUM_THREADS=64
taskset -c 0-63 ./sgemm.goto 200 4000 200

