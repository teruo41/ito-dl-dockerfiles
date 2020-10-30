FROM ubuntu:focal
MAINTAINER Teruo Tanimoto <tteruo@kyudai.jp>

SHELL ["/bin/bash", "-c"]
EXPOSE 8888

ARG CONDA="Anaconda3-2020.02-Linux-x86_64.sh"
ARG CONDAPKGS="jupyter python=3"
ARG CONDAENV="myenv"
RUN set -x \
    && apt-get update \
    && apt-get -y install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 \
        libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 wget \
        build-essential libboost-program-options-dev cmake \
    && rm -rf /var/lib/apt/lists/* \
    && set -x && mkdir /entry \
    && mkdir /tools \
    && cd \
    && wget https://repo.anaconda.com/archive/${CONDA} \
    && bash ~/${CONDA} -b -p /tools/anaconda3 \
    && rm ~/${CONDA} \
    && PATH="/tools/anaconda3/bin:${PATH}" conda init
RUN set -x \
    && export PATH="/tools/anaconda3/bin:${PATH}" \
    && conda create -n ${CONDAENV} ${CONDAPKGS} \
    && source activate ${CONDAENV} \
    && pip install -U pip \
    && pip install qiskit[visualization] networkx matplotlib
COPY launch-jupyter-notebook.sh /entry

ENTRYPOINT ["bash", "/entry/launch-jupyter-notebook.sh"]
CMD [""]
