FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 \
    autoconf-archive \
    libssl-dev libevent-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev \
    libboost-program-options-dev libboost-test-dev libboost-thread-dev libdb++-dev libsqlite3-dev \
    curl git && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Permanent configuration setup
RUN mkdir -p /root/.vitcoin
COPY vitcoin.conf /root/.vitcoin/vitcoin.conf

RUN ./autogen.sh && \
    ./configure --with-incompatible-bdb --without-gui --disable-tests --disable-bench --disable-utils && \
    make src/vitcoind -j$(nproc)

EXPOSE 22555 22556

# Ab hume CMD me lamba choura flags dene ki zaroorat nahi, sab conf file se load hoga
CMD ["./src/vitcoind", "-printtoconsole"]

