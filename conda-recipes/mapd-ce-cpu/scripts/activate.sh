#!/bin/bash

# bkp
export PATH_BACKUP=$PATH
export MAPD_USER_BACKUP=$MAPD_USER
export MAPD_GROUP_BACKUP=$MAPD_GROUP
export MAPD_STORAGE_BACKUP=$MAPD_STORAGE
export MAPD_PATH_BACKUP=$MAPD_PATH

# User specific aliases and functions
export MAPD_USER=$(whoami)
export MAPD_GROUP=$(whoami)
export MAPD_STORAGE=$CONDA_PREFIX/var/lib/mapd
export MAPD_PATH=$CONDA_PREFIX/opt/mapd

export PATH=$CONDA_PREFIX/opt/mapd/bin/:$CONDA_PREFIX/opt/mapd/:$CONDA_PREFIX/opt/mapd/systemd/:$PATH

