FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    fortune-mod \
    cowsay \
    netcat \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/games:${PATH}"

WORKDIR /app

COPY . /app/

RUN chmod +x /app/wisecow.sh

EXPOSE 4499

ENTRYPOINT ["/bin/bash", "/app/wisecow.sh"]
