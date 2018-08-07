FROM jupyter/scipy-notebook:177037d09156

COPY jupyter-mapd-renderer jupyter-mapd-renderer
RUN pip install -e ./jupyter-mapd-renderer

COPY requirements.txt .
RUN pip install -r requirements.txt 
RUN jlpm build
RUN jupyter labextension link

COPY . .

