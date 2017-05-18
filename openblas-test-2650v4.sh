#!/bin/bash

cd OpenBLAS-0.2.18
cd benchmark

export OPENBLAS_NUM_THREADS=1
echo "1 threads"
numactl -C 0 --localalloc ./sgemm.goto 200 4000 200

export OPENBLAS_NUM_THREADS=10
echo "10 threads"
numactl -C 0-9 --localalloc ./sgemm.goto 200 4000 200

export OPENBLAS_NUM_THREADS=24
echo "1 socket"
numactl --cpunodebind=0 --localalloc ./sgemm.goto 200 4000 200

export OPENBLAS_NUM_THREADS=48
echo "2 socket"
numactl --cpunodebind=0,1 --localalloc ./sgemm.goto 200 4000 200

