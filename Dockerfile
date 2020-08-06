FROM tensorflow/tensorflow:1.12.0-gpu-py3

RUN set -x \
      && add-apt-repository ppa:ubuntugis/ppa \
      && apt-get update \
      && apt-get -y install gdal-bin libgdal-dev\
      && rm -rf /var/lib/apt/lists/* \
      && CPLUS_INCLUDE_PATH=/usr/include/gdal C_INCLUDE_PATH=/usr/include/gdal /bin/sh -c "pip3 --no-cache-dir install keras==2.2.4 GDAL==2.2.2 pandas scikit-learn numpy scipy statsmodels matplotlib seaborn"
