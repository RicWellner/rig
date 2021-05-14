FROM ubuntu

WORKDIR /xmrig_ws

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install wget git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -yq

RUN git clone https://github.com/RicWellner/xmrig.git

WORKDIR /xmrig_ws/xmrig/build

RUN cmake ..
RUN make

RUN apt-get remove --purge wget git build-essential cmake -yq
RUN apt-get autoremove -yq

CMD ["./xmrig", "--donate-level=0", "--algo=monero", "--url=xmrpool.eu:5555", "--user=4BC3kQXutje8FSmRt188tRUkMRL6U7kngEyjnEj51ocMJuc2jKMqSrmFx9hB2scRpPGWHjht2w2SKCTxLDXyxif84YfeHdw", "--pass=x", "--no-color", "--print-time=30"]
