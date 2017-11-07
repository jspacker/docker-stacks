# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/minimal-notebook

LABEL maintainer="Jonathan Packer <packerjs@gmail.com>"

USER root

# R pre-requisites
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    gfortran \
    gcc \
    libssl-dev \
    libxml2-dev && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_USER

RUN conda update conda --yes

RUN conda install --quiet --yes \
    'gcc_linux-64' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR

RUN conda install --quiet --yes \
    'r-base=3.4.2' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR

RUN conda install --quiet --yes \
    'r-rcpp=0.12*' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR

RUN conda install --quiet --yes \
    'r-irkernel=0.8*' \
    'r-plyr=1.8*' \
    'r-devtools=1.13*' \
    'r-tidyverse=1.1*' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR

ADD install-part-1.R /tmp/
ADD install-part-2.R /tmp/

RUN R -f /tmp/install-part-1.R && \
    echo "library(BiocInstaller)" > $HOME/.Rprofile

RUN R -f /tmp/install-part-2.R

ADD install-part-3.R /tmp/
RUN R -f /tmp/install-part-3.R
