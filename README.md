# nubis-base

[![Version](https://img.shields.io/github/release/nubisproject/nubis-base.svg?maxAge=2592000)](https://github.com/nubisproject/nubis-base/releases)
[![Build Status](https://img.shields.io/travis/nubisproject/nubis-base/master.svg?maxAge=2592000)](https://travis-ci.org/nubisproject/nubis-base)
[![Issues](https://img.shields.io/github/issues/nubisproject/nubis-base.svg?maxAge=2592000)](https://github.com/nubisproject/nubis-base/issues)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fgozer%2Fnubis-base.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fgozer%2Fnubis-base?ref=badge_shield)

## Quick start

1. `git clone git@github.com:nubisproject/nubis-base.git`
2. `git clone git@github.com:nubisproject/nubis-builder.git`
3. Refer to README.md in nubis-builder on how to build this project.

## File structure

### `nubis`

All files related to the nubis base project

### `nubis/bin`

Scripts related to configuring nubis-base AMIs creation

### `nubis/librarian-puppet`

This is the puppet tree that's populated with librarian-puppet, it's in
.gitignore and gets reset on every build.

### `nubis/builder`

JSON files that describe the project, configure settings, configure
provisioners, etc.

### `nubis/terraform`

Terraform deployment templates.


## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fgozer%2Fnubis-base.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fgozer%2Fnubis-base?ref=badge_large)