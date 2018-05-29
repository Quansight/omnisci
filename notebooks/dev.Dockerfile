FROM jupyter/scipy-notebook:1085ca054a5f

COPY jupyter-mapd-renderer .
RUN cd jupyter-mapd-renderer && \
    pip install -e . && \
    jlpm build && \
    jupyter labextension link
