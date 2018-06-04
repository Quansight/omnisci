FROM jupyter/scipy-notebook:1085ca054a5f

COPY requirements.txt .

RUN pip install -r requirements.txt

RUN jupyter labextension install jupyterlab-mapd@0.3.0

COPY . .
