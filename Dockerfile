FROM nvcr.io/nvidia/tensorflow:20.01-tf2-py3

LABEL maintainer="wfedorko@triumf.ca"

RUN python3 -m pip uninstall -y numpy && python3 -m pip uninstall -y numpy && python3 -m pip uninstall -y numpy

RUN python3 -m pip install numpy

RUN rm -rv /usr/local/bin/jupyter* && python3 -m pip install --user --upgrade pip && python3 -m pip install --upgrade --force-reinstall jupyterlab && python3 -m pip install xgboost lightgbm seaborn h5py plotly line_profiler keras

RUN python3 -m pip install uproot
