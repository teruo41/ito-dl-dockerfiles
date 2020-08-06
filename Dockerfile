FROM tensorflow/tensorflow:1.12.0-gpu-py3

RUN set -x \
      && /bin/sh -c "pip3 --no-cache-dir install keras==2.2.4 GDAL pandas scikit-learn numpy scipy statsmodels matplotlib seaborn"
