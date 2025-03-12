FROM ubuntu:latest

ENV GITHUB_EVENT_NAME: ${{ github.event_name }}
ENV GITHUB_BEFORE: ${{ github.event.before }}
ENV GITHUB_SHA: ${{ github.sha }}
ENV GITHUB_PR_BASE_SHA: ${{ github.event.pull_request.base.sha }}
ENV GITHUB_PR_HEAD_SHA: ${{ github.event.pull_request.head.sha }}

RUN apt-get update && apt-get install -y \
 python3.10 \
 python3-pip \
 git \
 nodejs npm

RUN apt-get update 
RUN apt-get install -y clang-format
RUN pip install black --break-system-packages
RUN npm install -g prettier

COPY formatter.sh /usr/bin/formatter.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
