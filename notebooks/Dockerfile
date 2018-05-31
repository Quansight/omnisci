FROM jupyter/scipy-notebook:1085ca054a5f

RUN pip install --process-dependency-link \
    git+https://github.com/Quansight/jupyter-mapd-renderer.git@setup.py

RUN jupyter labextension install jupyterlab-mapd

COPY . .
