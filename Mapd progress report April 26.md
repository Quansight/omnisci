

```python
%reload_ext pidgin
%pidgin markdown conventions
```


```python
# April 26, 2018: Quansight - MapD Updates
```


# April 26, 2018: Quansight - MapD Updates



```python
## Ibis Updates

1. We open sourced [MapD specific Ibis Tutorials](https://github.com/Quansight/ibis-mapd-tutorials).
2. Significant progress has been completed for the [Ibis-MapD project](https://github.com/Quansight/ibis/projects/1) has been updated.
3. Presently, we are [addressing the continuous integration](https://github.com/ibis-project/ibis/pull/1419) to merge these efforts into Ibis core.
3. We are investigating work into temporary tables in the [Ibis Gitter](https://gitter.im/ibis-dev/Lobby).

```


## Ibis Updates

1. We open sourced [MapD specific Ibis Tutorials](https://github.com/Quansight/ibis-mapd-tutorials).
2. Significant progress has been completed for the [Ibis-MapD project](https://github.com/Quansight/ibis/projects/1) has been updated.
3. Presently, we are [addressing the continuous integration](https://github.com/ibis-project/ibis/pull/1419) to merge these efforts into Ibis core.
3. We are investigating work into temporary tables in the [Ibis Gitter](https://gitter.im/ibis-dev/Lobby).



```python
## JupyterLab Renderer

1. We open sourced the [jupyter-mapd-renderer](https://github.com/Quansight/jupyter-mapd-renderer) providing Jupyter users quick access.
    
    <pre><code>
    jupyter labextension install jupyterlab-mapd
    </code></pre>
    
2. MapD has it's own JupyterLab configuration settings.
        
2. We started communicating with the Vega and Altair teams to resolve some MapD specific issues.

    * [Vega-lite to Vega pull request accepted](https://github.com/altair-viz/altair/pull/770)
    * [MapD is an interesting vegalite use case.](https://github.com/vega/vega-lite/issues/3665 )
    * [Enabling Vega Lite in the MapD renderer](https://github.com/Quansight/jupyter-mapd-renderer/pull/7) 
    * [Thoughts on making Altair and MapD charting place nice.](https://github.com/Quansight/jupyter-mapd-renderer/issues/4 )
    
    

```


## JupyterLab Renderer

1. We open sourced the [jupyter-mapd-renderer](https://github.com/Quansight/jupyter-mapd-renderer) providing Jupyter users quick access.
    
    <pre><code>
    jupyter labextension install jupyterlab-mapd
    </code></pre>
    
2. MapD has it's own JupyterLab configuration settings.
        
2. We started communicating with the Vega and Altair teams to resolve some MapD specific issues.

    * [Vega-lite to Vega pull request accepted](https://github.com/altair-viz/altair/pull/770)
    * [MapD is an interesting vegalite use case.](https://github.com/vega/vega-lite/issues/3665 )
    * [Enabling Vega Lite in the MapD renderer](https://github.com/Quansight/jupyter-mapd-renderer/pull/7) 
    * [Thoughts on making Altair and MapD charting place nice.](https://github.com/Quansight/jupyter-mapd-renderer/issues/4 )
    
    



```python
## MapdD-core build

> ... on the building side there is nothing interesting to demo. The good news is that I am now able to successfully build mapd-core on a clean Ubuntu docker box
```


## MapdD-core build

> ... on the building side there is nothing interesting to demo. The good news is that I am now able to successfully build mapd-core on a clean Ubuntu docker box



```python
## Next: PyArrow Date Types
```


## Next: PyArrow Date Types



```python
## Next: Integrating Ibis, Altair, and PyMapD
```


## Next: Integrating Ibis, Altair, and PyMapD



```python
    
    digraph {
        compound=True;
        subgraph cluster_sql{label="sql" Ibis -> Compile -> Execute -> Ibis}
        subgraph cluster_viz{label="vega" Altair->"Vega-Lite"}
        "Vega-Lite" -> SVG -> Altair
        subgraph cluster_jupyter{label="Jupyter\nRenderer" Vega "MapD Vega"}
        "Vega-Lite" -> "Vega"
        {Compile Vega} -> "MapD Vega" -> PNG;
        Ibis -> Altair [ltail=cluster_sql];
        {Ibis Altair} -> "PyMapD API\nTODO"
        
    }
```


![svg](Mapd%20progress%20report%20April%2026_files/Mapd%20progress%20report%20April%2026_7_0.svg)



```python
    cp Mapd\ progress\ report\ April\ 26.ipynb ../mapd/
```


    cp Mapd\ progress\ report\ April\ 26.ipynb ../mapd/



```python
    

    !jupyter nbconvert --to markdown TemplateExporter.exclude_input=True Mapd\ progress\ report\ April\ 26.ipynb
```

    [NbConvertApp] WARNING | pattern 'TemplateExporter.exclude_input=True' matched no files
    [NbConvertApp] Converting notebook Mapd progress report April 26.ipynb to markdown
    [NbConvertApp] Support files will be in Mapd progress report April 26_files/
    [NbConvertApp] Making directory Mapd progress report April 26_files
    [NbConvertApp] Writing 4354 bytes to Mapd progress report April 26.md

