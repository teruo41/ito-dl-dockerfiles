FROM centos:centos7.3.1611

MAINTAINER Teruo Tanimoto <tteruo@kyudai.jp>

RUN set -x \
      && yum install -y epel-release \
      && yum update -y nss \
      && yum install -y R mesa-dri-drivers \
      && yum groupinstall -y "Development Tools" \
      && yum install -y --nogpgcheck https://download1.rstudio.org/desktop/centos7/x86_64/rstudio-1.3.1093-x86_64.rpm \
      && rm -rf /var/cache/yum/* \
      && yum clean all

#     && R -e 'install.packages("quantmod", repos="http://cran.us.r-project.org")' \
#     && R -e 'install.packages("txtplot", repos="http://cran.us.r-project.org")' \
