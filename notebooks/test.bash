#!/bin/bash
set -euxo
jupyter nbconvert --execute "Ibis + Altair.ipynb" "Vega Rendering.ipynb" "Altair Example - Bubble Plot.ipynb"
# git diff --exit-code
set +euxo
