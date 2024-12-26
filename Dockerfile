FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install prerequisites
RUN apt-get update && \
    apt-get install -y \
    fortune-mod \
    cowsay \
    netcat \
    && rm -rf /var/lib/apt/lists/* && \
    ln -s /usr/games/cowsay /usr/local/bin/cowsay && \
    ln -s /usr/games/fortune /usr/local/bin/fortune

# Set the PATH to include /usr/games
ENV PATH="/usr/games:/usr/local/bin:${PATH}"

WORKDIR /app

COPY . /app/

RUN chmod +x /app/wisecow.sh

EXPOSE 4499

ENTRYPOINT ["/bin/bash", "/app/wisecow.sh"]
