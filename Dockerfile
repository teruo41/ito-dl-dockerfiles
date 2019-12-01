FROM tensorflow/tensorflow:1.12.0-gpu-py3

RUN set -x \
      && apt-get update \
      && apt-get -y install openssh-client \
      && rm -rf /var/lib/apt/lists/* \
      && /bin/sh -c pip3 --no-cache-dir install jupyter_contrib_nbextensions \
      && /bin/sh -c jupyter contrib nbextension install --system \
      && /bin/sh -c pip3 --no-cache-dir install jupyter_nbextensions_configurator \
      && /bin/sh -c jupyter contrib nbextension_configurator enable --system
