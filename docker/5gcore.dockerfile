FROM ubuntu:focal

MAINTAINER Alexis de Talhouët <adetalhouet89@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
   apt-get -yq dist-upgrade && \
   apt-get --no-install-recommends -qqy install python3-pip python3-setuptools python3-wheel ninja-build build-essential flex bison git \
      libsctp-dev libgnutls28-dev libgcrypt-dev libssl-dev libidn11-dev libmongoc-dev libbson-dev libyaml-dev libnghttp2-dev \
      libmicrohttpd-dev libcurl4-gnutls-dev libnghttp2-dev libtins-dev libtalloc-dev meson \
      iptables iputils-ping tcpdump cmake curl gnupg iproute2
RUN git clone --recursive -b v2.6.4 https://github.com/open5gs/open5gs && \
   cd open5gs && meson build --prefix=/ && ninja -C build && cd build && ninja install

WORKDIR /
