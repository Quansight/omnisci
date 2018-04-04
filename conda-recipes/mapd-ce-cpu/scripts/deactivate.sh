#!/bin/bash

export PATH=$PATH_BACKUP
unset PATH_BACKUP

export MAPD_USER=$MAPD_USER_BACKUP
unset MAPD_USER_BACKUP
if [ -z $MAPD_USER ]; then
    unset MAPD_USER
fi

export MAPD_GROUP=$MAPD_GROUP_BACKUP
unset MAPD_GROUP_BACKUP
if [ -z $MAPD_GROUP ]; then
    unset MAPD_GROUP
fi

export MAPD_STORAGE=$MAPD_STORAGE_BACKUP
unset MAPD_STORAGE_BACKUP
if [ -z $MAPD_STORAGE ]; then
	unset MAPD_STORAGE
fi

export MAPD_PATH=$MAPD_PATH_BACKUP
unset MAPD_PATH_BACKUP
if [ -z $MAPD_PATH ]; then
	unset MAPD_PATH
fi
