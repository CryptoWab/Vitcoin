FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

# Sirf running runtime libraries install karenge, compilation tools nahi chahiye
RUN apt-get update && apt-get install -y \
    libssl-dev libevent-dev libboost-system-dev libboost-filesystem-dev \
    libboost-chrono-dev libboost-program-options-dev libboost-thread-dev \
    libdb++-dev libsqlite3-dev && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Binary ko execution permission dena pakka karne ke liye
RUN chmod +x ./src/vitcoind

EXPOSE 22555 22556
CMD ["./src/vitcoind", "-printtoconsole", "-rpcallowip=0.0.0.0/0", "-rpcbind=0.0.0.0", "-server=1"]

