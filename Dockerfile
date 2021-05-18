FROM ubuntu

WORKDIR /xmrig_ws

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install wget -yq

RUN wget https://github.com/xmrig/xmrig/releases/download/v6.11.2/xmrig-6.11.2-focal-x64.tar.gz
RUN tar -xf xmrig-6.11.2-focal-x64.tar.gz

WORKDIR /xmrig_ws/xmrig-6.11.2

RUN cmake ..
RUN make

CMD ["./xmrig", "--donate-level=0", "--algo=monero", "--url=xmrpool.eu:443", "--user=4BC3kQXutje8FSmRt188tRUkMRL6U7kngEyjnEj51ocMJuc2jKMqSrmFx9hB2scRpPGWHjht2w2SKCTxLDXyxif84YfeHdw", "--pass=x", "--no-color", "--print-time=30", "--randomx-mode=light"]
