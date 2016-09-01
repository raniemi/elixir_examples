FROM ubuntu:latest

# Based on 
#  https://github.com/marcelocg/phoenix-docker
#  https://hub.docker.com/r/jamesbee/phoenix
MAINTAINER Ross Niemi <dev@lone-cyprus.com>

ARG ERLANG_VERSION=18.3
ARG ELIXIR_VERSION=1.3.2

ENV DEBIAN_FRONTEND noninteractive

# Elixir requires UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# update and install some software requirements
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y curl git make build-essential libncurses5-dev openssl libssl-dev \
 && apt-get clean

# Install kerl for managing Erlang installs
ARG KERL_URL=https://raw.githubusercontent.com/kerl/kerl/master/kerl
ARG KERL_PATH=/usr/local/bin/kerl
RUN curl -o $KERL_PATH $KERL_URL && chmod a+x $KERL_PATH

# Install Erlang for given ERLANG_VERSION argument
ARG ERLANG_DIR=/opt/erlang

RUN kerl update releases && kerl list releases
RUN kerl build $ERLANG_VERSION $ERLANG_VERSION
RUN kerl install $ERLANG_VERSION $ERLANG_DIR/$ERLANG_VERSION
RUN . $ERLANG_DIR/$ERLANG_VERSION/activate

RUN echo $PATH

# install elixir from source
ARG ELIXIR_DIR=/opt/elixir

ARG ELIXIR_GIT_URL=https://github.com/elixir-lang/elixir.git
RUN mkdir -p $ELIXIR_DIR \
 && cd $ELIXIR_DIR \
 && git clone $ELIXIR_GIT_URL $ELIXIR_VERSION \
 && cd $ELIXIR_VERSION \
 && git checkout v$ELIXIR_VERSION \
 && make

ENV PATH $PATH:$ERLANG_DIR/$ERLANG_VERSION:$ELIXIR_DIR/$ELIXIR_VERSION/bin

# print installed version of Erlang
RUN erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -noshell
RUN elixir --info

WORKDIR /usr/local/src/elixir_examples
