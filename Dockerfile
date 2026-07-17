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

# -s hata diya aur single core par compile karenge taaki exact error line freeze ho jaye
RUN ./autogen.sh && \
    ./configure --with-incompatible-bdb --without-gui --disable-tests --disable-bench && \
    make

