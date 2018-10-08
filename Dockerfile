FROM alpine:3.8

MAINTAINER info@nodefactory.io

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker

# Install Docker and dependencies
RUN apk --update add \
  bash \
  iptables \
  ca-certificates \
  e2fsprogs \
  docker \
  py-pip \
  openssh-client \
  git \
  && chmod +x /usr/local/bin/wrapdocker \
  && rm -rf /var/cache/apk/*

RUN pip install --upgrade pip && pip install --no-cache-dir docker-compose==1.22

# Define additional metadata for our image.
VOLUME /var/lib/docker

ENV LOG=file

ENTRYPOINT ["wrapdocker"]

CMD []
