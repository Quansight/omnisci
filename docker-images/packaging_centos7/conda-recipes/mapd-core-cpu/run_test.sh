#!/bin/bash

export MODULEPATH=/usr/share/Modules/modulefiles:/etc/modulefiles
export MODULESHOME=/usr/share/Modules

eval $(/usr/bin/modulecmd bash load mapd-deps)

$CONDA_PREFIX/opt/mapd/bin/mapdql -v
