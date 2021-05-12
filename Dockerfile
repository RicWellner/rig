FROM ubuntu

WORKDIR /xmrig

RUN apt-get update && \
    apt-get install wget -y

RUN wget https://github.com/xmrig/xmrig/releases/download/v6.12.1/xmrig-6.12.1-linux-x64.tar.gz && \
    tar -zxf xmrig-6.12.1-linux-x64.tar.gz

WORKDIR /xmrig/xmrig-6.12.1

CMD ["./xmrig", "--donate-level=1", "--algo=monero", "--url=xmrpool.eu:5555", "--user=4BC3kQXutje8FSmRt188tRUkMRL6U7kngEyjnEj51ocMJuc2jKMqSrmFx9hB2scRpPGWHjht2w2SKCTxLDXyxif84YfeHdw", "--pass=x"]
