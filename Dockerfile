FROM nvcr.io/nvidia/tensorflow:21.03-tf2-py3

LABEL maintainer="mswiatlowski@triumf.ca"

ENV DEBIAN_FRONTEND=noninteractive

RUN python3 -m pip uninstall -y numpy

RUN apt-get update && apt install -y texlive-latex-extra texlive-fonts-recommended texlive-science texlive-lang-greek tex-gyre dvipng 

RUN apt-get --yes upgrade && apt-get --yes install strace locate ddd libxtst6 libxtst-dev libx11-dev libxpm-dev libxft-dev libxext-dev libssl-dev cmake

RUN rm -rv /usr/local/bin/jupyter* && python3 -m pip install --user --upgrade pip && python3 -m pip install --upgrade --force-reinstall jupyterlab && python3 -m pip install numpy uproot awkward vector atlas-mpl-style pydot graphviz xgboost lightgbm seaborn h5py plotly line_profiler keras tensorflow-addons energyflow

RUN wget https://root.cern/download/root_v6.22.06.source.tar.gz && tar -xzvf root_v6.22.06.source.tar.gz && rm root_v6.22.06.source.tar.gz && mkdir root_build root_install && cd root_build && export LD_LIBRARY_PATH=/usr/bin/python3:$LD_LIBRARY_PATH:$ROOTSYS/lib && cmake /workspace/root-6.22.06/ -DPYTHON_EXECUTABLE=/usr/bin/python3 -DCMAKE_INSTALL_PREFIX=../root_install -LA && cmake --build . -- -j24 && cmake --build . --target install && cd - && rm -r root-* root_build

RUN source /workspace/root_install/bin/thisroot.sh && python3 -m pip install root_numpy

RUN python3 -m pip install k3d
