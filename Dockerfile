FROM horovod/horovod:0.20.0-tf2.3.0-torch1.6.0-mxnet1.6.0.post0-py3.7-cuda10.1
MAINTAINER Teruo Tanimoto <tteruo@kyudai.jp>

RUN set -x \
      && apt-get update \
      && rm -rf /var/lib/apt/lists/* \
      && /bin/sh -c "pip3 --no-cache-dir install --upgrade pip" \
      && /bin/sh -c "pip3 --no-cache-dir install tqdm"
