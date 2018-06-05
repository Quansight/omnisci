# Example Notebooks


There are some example notebooks in this directory that should be run with Jupyterlab, with the mapd plugin installed.


* `Ibis + Altair.ipynb`: Creating a MapD query with Ibis and then visualizaing with Altair, with both the mapd vega backend and the browser backend.
* `Vega Rendering.ipynb`: Rendering vega and vega lite directly in the notebook to the mapd vega backend.

## CI
[![CircleCI](https://circleci.com/gh/Quansight/mapd.svg?style=svg)](https://circleci.com/gh/Quansight/mapd)

Running these notebooks is tested in CircleCI. It is tested with Conda, Pip, and in Docker.

It tests running the notebooks with `jupyter nbconvert --execute ...`. To change which notebooks
are tested, modify the `./test.bash` file.

## Running Notebooks

### Docker

```bash
docker-compose up jupyterlab
```

### Conda

```bash
conda env create -f environment.yml
conda activate mapd
jupyter labextension install jupyterlab-mapd
jupyter lab
```

### Pip

This requires nodejs < 10 installed.

```bash
python -m venv venv
. venv/bin/activate
pip install -r requirements.txt
jupyter labextension install jupyterlab-mapd
jupyter lab
```


## ...With Local Version of `Quansight/jupyter-mapd-renderer`

### Docker

*Note: this is not working yet. We need to fix some permission problems*

```bash
git clone git@github.com:Quansight/jupyter-mapd-renderer.git
docker-compose up jupyterlab-dev
```

Now you can edit the python and javscript files in `jupyter-mapd-renderer` and
see them reflected after you reload the page/kernel.
