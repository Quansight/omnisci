FROM centos:7
# Original DockerFile author:  Michael Sarahan <msarahan@continuum.io>
MAINTAINER Ivan Ogasawara <ivan.ogasawara@quansight.com>

WORKDIR /build_scripts

# https://github.com/mapd/mapd-core#centos-7
RUN yum groupinstall -y "Development Tools"
RUN yum install -y \
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

# COPY build_gcc.sh yum_cleanup.sh symlink_libraries.sh /build_scripts/
COPY yum_cleanup.sh symlink_libraries.sh /build_scripts/

# RUN bash build_gcc.sh
RUN bash yum_cleanup.sh && \
    bash symlink_libraries.sh && \
    rm -rf /build_scripts

# from continuumio/centos5_gcc5_base:5.11-5.2-1
# Original DockerFile author: Michael Sarahan <msarahan@continuum.io>

WORKDIR /build_scripts
COPY build/yum_install_syslibs.sh \
     build/install_miniconda.sh \
     build/yum_cleanup.sh \
     /build_scripts/

RUN bash yum_install_syslibs.sh
RUN bash install_miniconda.sh
RUN bash yum_cleanup.sh

RUN rm -rf /build_scripts && \
    mkdir -p /opt/share && \
    mkdir -p /opt/miniconda/conda-bld/work/linux-64 && \
    mkdir -p /opt/miniconda/conda-bld/work/linux-32 && \
    mkdir -p /opt/miniconda/conda-bld/work/noarch && \
    chmod -R 777 /opt && \
    useradd -m --uid 1000 -G wheel dev && \
    echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    echo 'Defaults:%wheel !requiretty' >> /etc/sudoers

ADD build/internal_startup.sh /opt/share/internal_startup.sh
ADD build/alias_32bit.sh /opt/share/alias_32bit.sh

RUN echo 'anaconda_upload: True' > /home/dev/.condarc && \
    echo 'channels:' >> /home/dev/.condarc && \
    echo '  - conda-forge' >> /home/dev/.condarc && \
    echo '  - defaults' >> /home/dev/.condarc

RUN echo 'conda-build --user quansight mapd-ce-cpu' > /home/dev/.bash_history

WORKDIR /home/dev/code
USER dev
