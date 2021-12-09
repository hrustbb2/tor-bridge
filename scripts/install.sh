#!/usr/bin/env bash

apk add git
apk add autoconf
apk add libtool
apk add automake
apk add build-base
apk add libevent-dev
apk add openssl-dev
apk add zlib-dev
apk add go

cd /home
mkdir tor
cd tor
# git clone https://git.torproject.org/tor.git .
git clone https://github.com/torproject/tor.git .
./autogen.sh
./configure --disable-asciidoc
make
make install

cd /home
mkdir obfs4proxy
cd obfs4proxy
git clone https://github.com/hrustbb2/obfs4proxy.git .
go build -o obfs4proxy/obfs4 ./obfs4proxy
cp obfs4proxy/obfs4 /usr/bin/obfs4proxy

tor -f /home/bridge.rc

sleep 3

cat /var/lib/tor/fingerprint
cat /var/lib/tor/pt_state/obfs4_bridgeline.txt

# docker build -f Dockerfile -t tor/bridge .
# docker run -d -p 35671:35671 tor/bridge home/start.sh