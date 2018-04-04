#!/bin/bash

mkdir -p $PREFIX/opt/mapd
cp -r * $PREFIX/opt/mapd

sed -i 's/mapd\.conf\.in/\$MAPD_PATH\/systemd\/mapd\.conf\.in/g' \
	$PREFIX/opt/mapd/systemd/install_mapd_systemd.sh

sed -i 's/ \$f/ \$MAPD_PATH\/systemd\/\$f/g' \
	$PREFIX/opt/mapd/systemd/install_mapd_systemd.sh

sed -i 's/\.\/bin/\$MAPD_PATH\/bin/g' $PREFIX/opt/mapd/insert_sample_data

mkdir -p $PREFIX/etc/conda/activate.d
mkdir -p $PREFIX/etc/conda/deactivate.d
cp $RECIPE_DIR/scripts/activate.sh $PREFIX/etc/conda/activate.d/mapd_env.sh
cp $RECIPE_DIR/scripts/deactivate.sh $PREFIX/etc/conda/deactivate.d/mapd_env.sh

