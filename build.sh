#!/bin/bash -ex

cd /server
git clone https://github.com/DataCentricAlliance/aerodrop.git
wget -q https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer
bash gvm-installer
chmod +x /root/.gvm/scripts/gvm
chmod +x /root/.gvm/scripts/gvm-default
cd /root/.gvm/scripts/
. gvm
cd /server/aerodrop
gvm install go1.4
gvm use go1.4 --global
export GOPATH=/server/aerodrop/_vendor
export PATH=$PATH:$GOPATH/bin:/root/.gvm/gos/go1.4/bin
go get github.com/mattn/gom
gom install
gom build -v
cp config.yaml /etc/aerodrop.yaml
cp aerodrop /usr/local/bin/aerodrop


