FROM nvcr.io/nvidia/tensorflow:19.10-py3

LABEL maintainer="wfedorko@triumf.ca"

RUN apt-get update
RUN apt-get --yes upgrade && apt-get --yes install strace locate pydb ddd libxtst6 libxtst-dev 

RUN rm -rv /usr/local/bin/jupyter* && python3 -m pip install --user --upgrade pip && python3 -m pip install --upgrade --force-reinstall jupyter && python3 -m pip install xgboost lightgbm seaborn h5py plotly line_profiler keras
