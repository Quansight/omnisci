#!/bin/bash

export MAPD_HOME=$PREFIX/opt/mapd

mkdir -p $MAPD_HOME
cd $MAPD_HOME

export MODULEPATH=/usr/share/Modules/modulefiles:/etc/modulefiles
export MODULESHOME=/usr/share/Modules

eval $(/usr/bin/modulecmd bash load mapd-deps)

cmake \
    -prefix=$MAPD_HOME \
    -DCMAKE_BUILD_TYPE=release \
    -DENABLE_CUDA=off \
    -DMAPD_IMMERSE_DOWNLOAD=on \
    -DMAPD_DOCS_DOWNLOAD=off \
    -DPREFER_STATIC_LIBS=on \
    -DENABLE_AWS_S3=on \
    -DENABLE_TESTS=on  \
    -DCMAKE_C_COMPILER=$CC \
    -DCMAKE_CXX_COMPILER=$CXX \
    $SRC_DIR

make -j 4

