FROM nvcr.io/nvidia/tensorflow:20.01-tf2-py3

LABEL maintainer="wfedorko@triumf.ca"

RUN python3 -m pip uninstall -y numpy && python3 -m pip uninstall -y numpy && python3 -m pip uninstall -y numpy

RUN python3 -m pip install numpy

RUN python3 -m pip install xgboost lightgbm seaborn h5py plotly line_profiler keras
