# DEPRECATED
yum install -y curl.x86_64 bzip2.x86_64 yum-utils glibc-devel patch \
    unzip bison yasm file make libtool.x86_64 pkgconfig.x86_64
# curl http://linuxsoft.cern.ch/cern/devtoolset/slc5-devtoolset.repo -o /etc/yum.repos.d/slc5-devtoolset.repo
#rpm --import http://ftp.mirrorservice.org/sites/ftp.scientificlinux.org/linux/scientific/51/i386/RPM-GPG-KEYs/RPM-GPG-KEY-cern
# yum install -y centos-release-SCL devtoolset-2
# Install devtoolset 2.
yum update -y && \
    yum install -y \
        centos-release-scl \
        yum-utils && \
    yum-config-manager --add-repo http://people.centos.org/tru/devtools-2/devtools-2.repo && \
    yum update -y && \
    yum install -y \
        devtoolset-2-binutils \
        devtoolset-2-gcc \
        devtoolset-2-gcc-c++ && \
    yum clean all
