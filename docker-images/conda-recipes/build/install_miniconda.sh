yum install -y wget

wget -O Miniconda.sh http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
# use miniconda3-4.2.12 to install conda build 2
# wget -O Miniconda.sh http://repo.continuum.io/miniconda/Miniconda3-4.2.12-Linux-x86_64.sh

/bin/bash Miniconda.sh -b -p /opt/miniconda
rm Miniconda.sh
/opt/miniconda/bin/conda config --set show_channel_urls True
/opt/miniconda/bin/conda update --yes --all
/opt/miniconda/bin/conda install --yes git conda-build=3.* curl anaconda-client
/opt/miniconda/bin/conda clean --tarballs --packages
