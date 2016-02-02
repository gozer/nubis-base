#!/bin/bash

set -x

which  librarian-puppet 2>/dev/null 1>/dev/null || sudo apt-get install -y ruby-dev
which  librarian-puppet 2>/dev/null 1>/dev/null || ( sudo gem install librarian-puppet -v 2.2.1 && sudo gem install puppet
test -r nubis/Puppetfile && ( cd nubis && librarian-puppet install --path librarian-puppet/etc/puppet/modules --verbose
test -d nubis/librarian-puppet/etc/puppet/modules && tar -C nubis/librarian-puppet --exclude='.git' -zpcf nubis/librarian-puppet.tar.gz .
