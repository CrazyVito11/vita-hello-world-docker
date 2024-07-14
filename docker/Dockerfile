FROM debian:bookworm

RUN mkdir /setup
WORKDIR /setup

# Update the Debian image
RUN apt update && apt upgrade --yes
RUN apt install curl wget make cmake git python3 python3-pip sudo bzip2 xz-utils netcat-traditional --yes

ENV VITASDK=/usr/local/vitasdk

# Install Vita SDK
RUN ln -s /proc/self/mounts /etc/mtab
RUN git clone https://github.com/vitasdk/vdpm; \
    cd vdpm; \
    ./bootstrap-vitasdk.sh; \
    ./install-all.sh

# Update the path to include the build tools
ENV PATH=${VITASDK}/bin:$PATH

# Install Vita Parse Core
# Note: We manually install pyelftools 0.26, as 0.24 doesn't work properly on Python 3.9
RUN git clone https://github.com/xyzz/vita-parse-core.git; \
    cd vita-parse-core; \
    pip install pyelftools==0.26 --break-system-packages; \
    mkdir -p /usr/share/python-vita-parse-core; \
    cp -r * /usr/share/python-vita-parse-core; \
    mkdir -p /usr/bin
COPY vita-parse-core.sh /usr/bin/

WORKDIR /project

# Prevent the container from quitting automatically
ENTRYPOINT ["tail", "-f", "/dev/null"]
