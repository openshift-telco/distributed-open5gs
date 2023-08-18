FROM ubuntu:focal

MAINTAINER Alexis de Talhouët <adetalhouet89@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

USER root

RUN apt-get update && \
   apt-get --no-install-recommends -y  install iputils-ping snapd make gcc g++ libsctp-dev lksctp-tools iproute2 git wget

RUN wget https://cmake.org/files/v3.22/cmake-3.22.0-linux-x86_64.tar.gz && tar xf cmake-3.22.0-linux-x86_64.tar.gz \
   && ln -s `pwd`/cmake-3.22.0-linux-x86_64/bin/cmake /usr/sbin/cmake

RUN git clone --recursive -b v3.2.3 https://github.com/aligungr/UERANSIM && \
   cd UERANSIM && make

WORKDIR /UERANSIM/build