FROM ubuntu:16.04

## ensure locale is set during build
ENV LANG            C.UTF-8

## Haskell environment
RUN echo 'deb http://ppa.launchpad.net/hvr/ghc/ubuntu xenial main' > \
      /etc/apt/sources.list.d/ghc.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F6F88286 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      cabal-install-2.2 \
      ghc-8.4.2 \
      happy-1.19.5 \
      alex-3.1.7 \
      zlib1g-dev \
      libtinfo-dev \
      libsqlite3-0 \
      libsqlite3-dev \
      ca-certificates \
      build-essential \
      libgmp-dev \
      autoconf \
      automake \
      curl \
      g++ \
      python3 \
      git

ENV PATH /root/.cabal/bin:/root/.local/bin:/opt/cabal/bin:/opt/ghc/8.4.2/bin:/opt/happy/1.19.5/bin:/opt/alex/3.1.7/bin:$PATH

## node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs


## build GHCJS
WORKDIR /opt

RUN cabal update

RUN git clone https://github.com/alexanderkjeldaas/ghcjs.git && \
    cd ghcjs && \
    git checkout ghc-8.4 && \
    git submodule update --init --recursive


RUN cd ghcjs && ./utils/makePackages.sh -j8
RUN tar cf ghcjs.tar ghcjs && gzip --fast ghcjs.tar