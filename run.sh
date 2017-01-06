#!/bin/bash

PACKER_VERSION="0.12.1"

set -x

pip install --user awscli==1.11.36

export PATH=$PATH:$HOME/.local/bin:$HOME/nubis-builder/bin

aws s3 ls

PACKER_V=$(packer --version 2>/dev/null)

if [ "$PACKER_V" != "$PACKER_VERSION" ]; then
  wget -O /tmp/packer.zip "https://releases.hashicorp.com/packer/$PACKER_VERSION/packer_${PACKER_VERSION}_linux_amd64.zip"
  cd "$HOME/bin" && unzip /tmp/packer.zip
fi

packer --version

#XXX: cleanup temporarly
rm -rf nubis-builder

if [ ! -d nubis-builder ]; then
  git clone https://github.com/nubisproject/nubis-builder.git nubis-builder
fi

cd nubis-builder && ( git pull && git fetch --tags && git checkout v1.3.0 )

nubis-builder --version

nubis-builder build

exit 0
