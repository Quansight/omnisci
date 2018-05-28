FROM centos:7
MAINTAINER Ivan Ogasawara <ivan.ogasawara@gmail.com>

USER root

RUN yum groupinstall -y "Development Tools" && \
    yum install -y \
      zlib-devel \
      epel-release \
      libssh \
      openssl-devel \
      ncurses-devel \
      git \
      maven \
      java-1.8.0-openjdk-devel \
      java-1.8.0-openjdk-headless \
      gperftools \
      gperftools-devel \
      gperftools-libs \
      python-devel \
      wget \
      curl \
      environment-modules

RUN curl -OJ https://internal-dependencies.mapd.com/mapd-deps/deploy.sh

RUN yum install -y sudo

ENV HOME=/home/default \
    USER=default

RUN mkdir -p ${HOME} && \
    groupadd -r default -f -g 1001 && \
    useradd -u 1001 -r -g default -d ${HOME} -s /sbin/nologin \
    -c "Default Application User" default

RUN passwd -d $(id -nu 1001)
RUN passwd -d $(id -nu 0)
RUN echo '%default ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN head -n -9 deploy.sh > deploy-head.sh && chmod +x deploy-head.sh
RUN tail -n 9 deploy.sh > deploy-tail.sh && chmod +x deploy-tail.sh

RUN bash deploy-head.sh

RUN sed -i -e 's/sudo bash -c "//g' deploy-tail.sh && \
    sed -i -e 's/>> $PROFPATH"/>> $PROFPATH/g' deploy-tail.sh

RUN sudo bash deploy-tail.sh

RUN chown -R default.default $HOME

RUN wget -O Miniconda.sh http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

RUN /bin/bash Miniconda.sh -b -p /opt/miniconda
RUN rm Miniconda.sh && \
  /opt/miniconda/bin/conda config --set show_channel_urls True && \
  /opt/miniconda/bin/conda update --yes --all  && \
  /opt/miniconda/bin/conda install --yes git conda-build=3.* curl anaconda-client && \
  /opt/miniconda/bin/conda clean --tarballs --packages

RUN yum install -y which

# RUN cp -R /root/* ${HOME}/ && \
#    chown -R ${USER}.${USER} ${HOME}

# USER 1001

ENV CONDA_PATH=/opt/miniconda/bin \
    CONDA_ROOT=/opt/miniconda \
    MODULEPATH=/usr/share/Modules/modulefiles:/etc/modulefiles \
    MODULESHOME=/usr/share/Modules

RUN ${CONDA_PATH}/conda config --add channels conda-forge
RUN mkdir -p ${CONDA_ROOT}/conda-bld/src_cache
COPY v3.6.0_402140dc51.tar.gz ${CONDA_ROOT}/conda-bld/src_cache/v3.6.0_402140dc51.tar.gz

COPY conda-recipes ${HOME}/conda-recipes

RUN eval $(/usr/bin/modulecmd bash load mapd-deps) && \
    cd ${HOME}/conda-recipes && \
    echo "${CONDA_PATH}/conda-build mapd-core-cpu"

WORKDIR ${HOME}/conda-recipes

