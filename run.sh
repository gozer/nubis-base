#!/bin/bash

set -x

pip install --user awscli

export PATH=$PATH:$HOME/.local/bin

aws s3 ls

PACKER_V=$(packer --version 2>/dev/null)

if [ "$PACKER_V" != "0.12.1" ]; then
  wget -O /tmp/packer.zip https://releases.hashicorp.com/packer/0.12.1/packer_0.12.1_linux_amd64.zip
  cd $HOME/bin && unzip /tmp/packer.zip
fi

packer --version

if [ ! -d nubis-builder ]; then
  git clone https://github.com/nubisproject/nubis-builder nubis-builder
fi

cd nubis-builder && ( git pull --tags && git checkout v1.3.0 )

exit 0
