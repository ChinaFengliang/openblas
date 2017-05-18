#!/bin/bash

export LC_ALL=C

ARCH=`uname -m`

OPENBLAS=OpenBLAS-0.2.18.tar.gz
OPENBLAS_DIR=OpenBLAS-0.2.18

if $(which yum >/dev/null 2>&1); then
	yum install -y *gfortran*
fi

if $(which apt-get >/dev/null 2>&1); then
	apt-get install *gfortran*
fi

#git clone https://github.com/xianyi/OpenBLAS.git
if [ ! -d $OPENBLAS_DIR ]; then
	tar xf $OPENBLAS
fi

cd $OPENBLAS_DIR

if [ $ARCH -eq "aarch64" ]; then
	make clean
	make TARGET=ARMV8 BINARY=64
	cd benchmark
	make clean
	#make TARGET=ARMV8 BINARY=64
	make TARGET=ARMV8 BINARY=64 sgemm.goto
else
	make clean
	make BINARY=64
	cd benchmark
	make clean
	make BINARY=64 sgemm.goto
fi
