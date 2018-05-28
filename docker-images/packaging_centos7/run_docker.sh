#!/bin/bash
docker run -it -v /home/xmn/.ssh/id_rsa:/id_rsa:ro -v /home/xmn/.gitconfig:/home/dev/.gitconfig:ro   pkg_mapd_centos7 bash
