FROM ubuntu:latest

MAINTAINER brian@brianegan.com

WORKDIR /

RUN apt-get update && \
    apt-get install -y lcov git-core curl unzip && \
    git clone https://github.com/flutter/flutter.git && \
    /flutter/bin/flutter doctor && \
    apt-get remove -y git-core curl unzip && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/*

ENV PATH $PATH:/flutter/bin/cache/dart-sdk/bin:/flutter/bin
