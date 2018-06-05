#!/bin/bash
set -euxo
jupyter nbconvert --execute "Ibis + Altair.ipynb" "Vega Rendering.ipynb"
# git diff --exit-code
set +euxo
