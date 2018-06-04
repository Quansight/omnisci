FROM jupyter/scipy-notebook:1085ca054a5f

COPY jupyter-mapd-renderer .
RUN pip install -e ./jupyter-mapd-renderer

COPY requirements.txt .
RUN pip install -r requirements.txt 
RUN jlpm build
RUN jupyter labextension link

COPY . .

