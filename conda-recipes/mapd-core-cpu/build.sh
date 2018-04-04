#!/bin/bash

mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=release -DENABLE_CUDA=off \
      -DMAPD_IMMERSE_DOWNLOAD=on -DMAPD_DOCS_DOWNLOAD=off -DPREFER_STATIC_LIBS=on \
      -DENABLE_AWS_S3=on -DENABLE_TESTS=on  -DCMAKE_C_COMPILER=clang \
      -DCMAKE_CXX_COMPILER=clang ..
make -j 4
