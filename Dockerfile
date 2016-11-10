From node:4

# System packages
RUN apt-get update && apt-get install -y curl \
libzmq-dev \
build-essential \
g++ \
git

# build jupyter notebook node js kernel
Run git clone https://github.com/notablemind/jupyter-nodejs.git
WORKDIR jupyter-nodejs
Run mkdir -p ~/.ipython/kernels/nodejs/
Run npm install && node install.js
Run make

# Install miniconda to /miniconda
RUN curl -LO http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
RUN bash Miniconda-latest-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda-latest-Linux-x86_64.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda

# Install jupyter
RUN conda install -y jupyter

# Setup jupyter
EXPOSE 8888
RUN mkdir -p /notebook
WORKDIR /notebook
CMD ["/bin/sh", "-c", "/miniconda/bin/jupyter-notebook --no-browser --ip=0.0.0.0"]
