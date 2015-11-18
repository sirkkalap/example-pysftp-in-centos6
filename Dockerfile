from centos:6

MAINTAINER Petri Sirkkala <sirpete@iki.fi>

RUN yum -y update && yum -y install wget && \
    wget http://ftp-stud.hs-esslingen.de/pub/epel/6/i386/epel-release-6-8.noarch.rpm && \
    yum -y install epel-release-6-8.noarch.rpm && \
    rm epel-release-6-8.noarch.rpm && \
    yum -y install python-pip && \
    yum -y install python-crypto && \
    yum -y clean all

# We need --no-deps because pyCrypto 2.0.1 is already installed
# and depended new version will not compile in CentOS6
RUN pip install --no-deps ecdsa paramiko pysftp

ENTRYPOINT ["/bin/bash"]

