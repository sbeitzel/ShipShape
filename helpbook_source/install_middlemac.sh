#!/bin/sh

# install rbenv
brew install rbenv

# install ruby 3.4.4
rbenv install 3.4.4

# make sure we're using 3.4.4
rbenv global 3.4.4

# install Middlemac
CURRENT = ${pwd}
cd /tmp
git clone https://github.com/sbeitzel/middlemac.git
cd middlemac

bundle install
rake install

cd /tmp
rm -rf middlemac

cd $(CURRENT)

# now, make sure the helpbook is ready to build
bundle install
