FROM jupyter/scipy-notebook:1085ca054a5f

COPY jupyter-mapd-renderer .
RUN pip install -e jupyter-mapd-renderer
