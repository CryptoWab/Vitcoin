FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 \
    libssl-dev libevent-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev \
    libboost-program-options-dev libboost-test-dev libboost-thread-dev libdb++-dev libsqlite3-dev \
    curl git && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . .
RUN ./autogen.sh && ./configure --with-incompatible-bdb --without-gui --disable-tests --disable-bench && make -j$(nproc)
EXPOSE 22555 22556
CMD ["./src/vitcoind", "-printtoconsole", "-rpcallowip=0.0.0.0/0", "-rpcbind=0.0.0.0", "-server=1"]

