FROM ubuntu:18.04

RUN apt-get update -q && apt-get install -qy \
  bash \
  build-essential \
  curl \
  git \
  g++ \
  make \
  nodejs \
  python \
  software-properties-common \
  sudo \
  && apt-get clean && apt-get purge \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sL https://particle.io/install-cli | bash

RUN mkdir /app

VOLUME ["/input", "/output"]

COPY ./run /app

CMD ["/app/run"]


