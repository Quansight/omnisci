#!/bin/bash

PROFPATH=/etc/profile.d/xx-mapd-deps.sh
if [ ! -f "$PROFPATH" ] ; then
  if [ "$ENABLE_MODULES" = true ] ; then
    sudo bash -c "echo 'ls' >> $PROFPATH"
  else
    sudo bash -c "echo 'ls -lah' >> $PROFPATH"
  fi
  source $PROFPATH
fi

