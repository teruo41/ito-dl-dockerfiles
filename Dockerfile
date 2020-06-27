FROM tensorflow/tensorflow:1.12.0-gpu-py3

RUN set -x \
      && apt-get update \
      && apt-get -y install openssh-client libsm6 libxrender1 libxext-dev \
         ffmpeg x264 libx264-dev libxcb-randr0 libxcb-render0 \
      && rm -rf /var/lib/apt/lists/* \
      && /bin/sh -c "pip3 --no-cache-dir install keras==2.2.4 opencv-python"
