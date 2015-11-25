FROM ubuntu:latest

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
RUN apt-get update && apt-get upgrade -y && apt-get install -y curl wget git make

# download and install Erlang package
RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb \
 && dpkg -i erlang-solutions_1.0_all.deb \
 && apt-get update

# install erlang from package
RUN apt-get install -y erlang erlang-ssl erlang-inets \
 && rm erlang-solutions_1.0_all.deb \
 && apt-get clean

# install elixir from source
ENV ELIXIR_VERSION 1.1.1
RUN git clone https://github.com/elixir-lang/elixir.git && cd elixir && git checkout v$ELIXIR_VERSION && make
ENV PATH $PATH:/elixir/bin

WORKDIR /code
