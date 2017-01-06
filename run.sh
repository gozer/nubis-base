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
