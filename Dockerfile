FROM ubuntu:latest

ARG ERLANG_VERSION=19.0.3
ARG ELIXIR_VERSION=1.3.2

# Based on 
#  https://github.com/marcelocg/phoenix-docker
#  https://hub.docker.com/r/jamesbee/phoenix
MAINTAINER Ross Niemi <dev@lone-cyprus.com>

ENV DEBIAN_FRONTEND noninteractive

# Elixir requires UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# update and install some software requirements
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
        curl \
        #wget \
        #git \
        #make \
        lsb-release \
        #devscripts \
        libwxgtk3.0-dev \
        libglu-dev

# Add repository mirror
ARG ES_MIRROR=https://dl.bintray.com/raniemi/erlang-solutions-unofficial-mirror
ARG COMPONENTS=contrib
RUN export DISTRIBUTION=`lsb_release -sc` \
 && echo "deb $ES_MIRROR $DISTRIBUTION $COMPONENTS" | tee -a /etc/apt/sources.list

# install specific version of Erlang from Erlang Solutions
RUN export ERLANG_DEB=esl-erlang_$ERLANG_VERSION-1~ubuntu~`lsb_release -sc`_amd64.deb \
 && curl -L "$ES_MIRROR/$ERLANG_DEB" -o $ERLANG_DEB \
 && dpkg -i $ERLANG_DEB

# install specific version of Elixir from Erlang Solutions
RUN export ELIXIR_DEB=elixir_$ELIXIR_VERSION-1~ubuntu~`lsb_release -sc`_amd64.deb \
 && curl -L "$ES_MIRROR/$ELIXIR_DEB" -o $ELIXIR_DEB \
 && dpkg -i $ELIXIR_DEB

WORKDIR /usr/local/src/elixir_examples
