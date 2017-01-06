#!/bin/bash
set -x

if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
  exit 0
fi

PACKER_VERSION="0.12.1"
NUBIS_BUILDER_VERSION="v1.3.0"
AWSCLI_VERSION="1.11.36"

export PATH=$PATH:$HOME/.local/bin:$HOME/nubis-builder/bin

pip install --user awscli==$AWSCLI_VERSION

if [ "$(packer --version 2>/dev/null)" != "$PACKER_VERSION" ]; then
  wget -O /tmp/packer.zip "https://releases.hashicorp.com/packer/$PACKER_VERSION/packer_${PACKER_VERSION}_linux_amd64.zip"
  cd "$HOME/bin" && unzip /tmp/packer.zip
fi

packer --version

if [ ! -d "$HOME/nubis-builder" ]; then
  git clone https://github.com/nubisproject/nubis-builder.git "$HOME/nubis-builder"
fi

( cd "$HOME/nubis-builder" && ( git pull && git fetch --tags && git checkout "$NUBIS_BUILDER_VERSION" ) )

nubis-builder --version

cat <<"EOF" > "$HOME/nubis-builder/secrets/variables.json"
{
  "variables": {
    "aws_region": "${AWS_REGION:-us-west-2}",
    "ami_regions": "ap-northeast-1,ap-northeast-2,ap-southeast-1,ap-southeast-2,eu-central-1,eu-west-1,sa-east-1,us-east-1,us-west-1,us-west-2"
  }
}
EOF

if [ "$BUNDLE_GEMFILE" == "" ]; then
  BUNDLE_GEMFILE="$(cd "$(dirname "$0")" && pwd)/Gemfile"
  export BUNDLE_GEMFILE
fi

# Let's find librarian-puppet, m'kay?
bundle exec librarian-puppet --version
bundle exec env | grep PATH

#nubis-builder build

exit 0
