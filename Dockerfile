FROM tensorflow/tensorflow:1.12.0-gpu-py3

RUN set -x \
      && apt-get update \
      && apt-get -y install openssh-client libsm6 libxrender1 libxext-dev \
      && rm -rf /var/lib/apt/lists/* \
      && /bin/sh -c "pip3 --no-cache-dir install keras opencv-python"
