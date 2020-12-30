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

COPY ./run /app

RUN useradd -d /app -u 1000 app && chown -Rf app: /app

VOLUME ["/input", "/output"]

USER app

CMD ["/app/run"]
