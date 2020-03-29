FROM jupyter/base-notebook

USER $NB_UID

RUN pip install --no-cache-dir \
    'numpy==1.16.4' \
    'plotly==4.5.4' \
    'matplotlib==3.1.0' \
    'mne==0.18.1' \
    'ipywidgets==7.5' 
RUN pip install -U jupyterlab==1.2 
RUN conda clean --all -f -y

USER root
RUN export NODE_OPTIONS=--max-old-space-size=4096
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@1.1 --no-build
RUN jupyter labextension install plotlywidget@1.5.4 --no-build
RUN jupyter labextension install @mohirio/jupyterlab-horizon-theme@1.2.1 --no-build
RUN jupyter lab build
RUN npm cache clean --force && \
    unset NODE_OPTIONS && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    rm -rf /home/$NB_USER/.cache && \
    rm -rf /home/$NB_USER/.node-gyp && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

ENV JUPYTER_ENABLE_LAB=yes
USER $NB_UID