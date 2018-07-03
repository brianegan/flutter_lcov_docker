FROM ubuntu:latest

MAINTAINER brian@brianegan.com

WORKDIR /

RUN apt-get update && \
    apt-get install -y lcov git-core curl unzip libglu1 && \
    git clone --branch v0.5.1 --depth=1 https://github.com/flutter/flutter.git && \
    /flutter/bin/flutter doctor && \
    apt-get remove -y curl unzip && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/*

ENV PATH $PATH:/flutter/bin/cache/dart-sdk/bin:/flutter/bin
