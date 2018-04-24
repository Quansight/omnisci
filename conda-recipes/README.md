# CONDA PACKAGES

There are a alpha conda packages for MapD CE CPU and MapD Render available on Quansight channel:

- https://anaconda.org/Quansight/mapd-ce-render
- https://anaconda.org/Quansight/mapd-ce-cpu

The recipes are available at:

- https://github.com/Quansight/mapd/tree/master/conda-recipes/mapd-ce-cpu
- https://github.com/Quansight/mapd/tree/master/conda-recipes/mapd-ce-render

There is also a work-in-progress recipe for mapd-core-cpu, available at:

- https://github.com/Quansight/mapd/tree/master/conda-recipes/mapd-core-cpu

At this moment, there are two dependencies that should be resolved to continue the packaging: gperftools and folly.

Instructions for MapD CE alpha packages installation:

Add conda-forge channel to conda:

`conda config --add channels conda-forge`

Add quansight channel to conda: 

`conda config --add channels quansight`

Create an anaconda  or miniconda environment and make it active:

```sh
conda create --name mapd
conda activate mapd
```

For CPU package: 

`conda install mapd-ce-cpu` 

For Render (GPU) package:

`conda install mapd-ce-render`

To execute the follow commands, do it on a new console/terminal, and open the conda environment created.

MapD database initialisation:

`install_mapd_systemd.sh`

MapD activation

`sudo systemctl start mapd_server`
`sudo systemctl start mapd_web_server`

Enable MapD Core to start when the system reboots (optional)

`sudo systemctl enable mapd_server`
`sudo systemctl enable mapd_web_server`

Install sample data (optional)

`insert_sample_data`

Execute mapdql (Default password: HyperInteractive)

`mapdql`


MapD Immerse:

On an web browser: http://localhost:9092
