FROM nvcr.io/nvidia/tensorflow:19.11-tf2-py3

LABEL maintainer="wfedorko@triumf.ca"

RUN apt-get update
RUN apt-get --yes upgrade && apt-get --yes install strace locate pydb ddd libxtst6 libxtst-dev 

RUN pip install xgboost lightgbm seaborn h5py plotly line_profiler
