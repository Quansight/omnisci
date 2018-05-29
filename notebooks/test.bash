#!/bin/bash
set -euxo

jupyter nbconvert --execute "Ibis + Altair.ipynb"
jupyter nbconvert --execute "Vega Rendering.ipynb"

set +euxo
