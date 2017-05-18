#!/bin/bash

cd OpenBLAS-0.2.18
cd benchmark

export OPENBLAS_NUM_THREADS=1
echo "1 threads"
numactl -C 0 --localalloc ./sgemm.goto 200 4000 200

export OPENBLAS_NUM_THREADS=10
echo "10 threads"
numactl -C 0-9 --localalloc ./sgemm.goto 200 4000 200

export OPENBLAS_NUM_THREADS=32
echo "32 threads"
numactl --cpunodebind=0 --localalloc ./sgemm.goto 200 4000 200

export OPENBLAS_NUM_THREADS=64
echo "64 threads"
numactl --cpunodebind=0-3 --localalloc ./sgemm.goto 200 4000 200
