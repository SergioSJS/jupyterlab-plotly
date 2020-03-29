# jupyterlab-plotly
Docker Image with 
* FROM jupyter/base-notebook
* jupyterlab==1.2
* plotly==4.5.4

## Usage
Pull the image:
```
docker pull sergiosjs/jupyterlab-plotly
```
And run:
```
docker run -p 8888:8888 -v "/your/work/directory":/home/jovyan/work sergiosjs/jupyterlab-plotly
```
