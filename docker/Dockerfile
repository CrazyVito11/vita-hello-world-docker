FROM debian:bookworm

RUN mkdir /setup
WORKDIR /setup

# Update the Debian image
RUN apt update && apt upgrade --yes
RUN apt install curl wget make cmake git python3 sudo bzip2 xz-utils --yes

ENV VITASDK=/usr/local/vitasdk

# Install Vita SDK
RUN ln -s /proc/self/mounts /etc/mtab
RUN git clone https://github.com/vitasdk/vdpm; \
    cd vdpm; \
    ./bootstrap-vitasdk.sh; \
    ./install-all.sh

# Update the path to include the build tools
ENV PATH=${VITASDK}/bin:$PATH

WORKDIR /project

# Prevent the container from quitting automatically
ENTRYPOINT ["tail", "-f", "/dev/null"]
