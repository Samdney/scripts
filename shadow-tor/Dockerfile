FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    apt-utils

# Install shadow dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    gcc \
    g++ \
    python \
    libglib2.0-0 \
    libglib2.0-dev \
    libigraph0v5 \
    libigraph0-dev \
    cmake \
    make \
    xz-utils \
    libc-dbg \
    python-matplotlib \
    python-numpy \
    python-scipy \
    python-networkx \
    python-lxml \
    git \
    dstat \
    screen \
    htop


# Install shadow-tor dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    automake \
    autoconf \
#    zlib \
#    zlib-devel \
    zlib1g-dev \
    gpg \
    tar


# Set shadow-tor user with password shadow-tor
RUN apt-get install -y passwd sudo \
    && useradd --create-home --shell /bin/bash shadow-tor \
    && echo 'shadow-tor:shadow-tor' | chpasswd \
    && adduser shadow-tor sudo

USER shadow-tor
WORKDIR /home/shadow-tor


# Install shadow
RUN cd /home/shadow-tor \
    && git clone https://github.com/shadow/shadow.git \
    && cd shadow \
    && ./setup build \
    && ./setup install

RUN echo "export PATH=${PATH}:/home/${USER}/.shadow/bin" >> ~/.bashrc && bash


# Install shadow-tor
RUN cd /home/shadow-tor \
    && git clone https://github.com/shadow/shadow-plugin-tor.git \
    && cd shadow-plugin-tor \
    && echo "yes\nno\nyes\nno" | ./setup dependencies \
    && echo "yes\nno" | ./setup build \
    && ./setup install 
