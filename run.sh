#!/bin/bash

set -x

pip install --user awscli

export PATH=$PATH:$HOME/.local/bin

aws s3 ls
