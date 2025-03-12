FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
 python3.10 \
 python3-pip \
 git \
 nodejs npm

RUN apt-get update 
RUN apt-get install -y clang-format
RUN pip install black --break-system-packages
RUN npm install -g prettier

COPY formatter.sh /github/workspace/formatter.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
