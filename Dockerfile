FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
 python3.10 \
 python3-pip \
 git

RUN  sudo apt-get update \
 sudo apt-get install nodejs npm \
 sudo apt-get install -y clang-format \
 pip install black \
 npm install -g prettier

COPY formatter.sh /usr/bin/formatter.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
