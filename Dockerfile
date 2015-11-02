FROM ubuntu:vivid
MAINTAINER y.takahara@gmail.com

ENV DEBIAN_FRONTEND noninteractive


# Usual update / upgrade
RUN apt-get update
RUN apt-get upgrade -q -y
RUN apt-get dist-upgrade -q -y

# Let our containers upgrade themselves
RUN apt-get install -q -y unattended-upgrades

# Install GVM
RUN apt-get install -y curl git
RUN apt-get install -y binutils bison gcc make
RUN curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer|bash

# Install GVM 1.4
RUN bash -c "source /root/.gvm/scripts/gvm &&\
    gvm install go1.4 &&\
    gvm use go1.4 --default"


