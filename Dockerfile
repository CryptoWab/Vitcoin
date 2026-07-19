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

# Chisel download karne ke liye (gzip package ke sath)
RUN apt-get update && apt-get install -y curl gzip && \
    curl -sSL https://github.com/jpillora/chisel/releases/download/v1.10.0/chisel_1.10.0_linux_amd64.gz | gunzip > /usr/local/bin/chisel && \
    chmod +x /usr/local/bin/chisel

# Vitcoin aur Chisel dono ko ek sath chalu karne ke liye
CMD ./vitcoind -daemon && chisel server --port $PORT --auth "vitcoin:supersecretpass"
