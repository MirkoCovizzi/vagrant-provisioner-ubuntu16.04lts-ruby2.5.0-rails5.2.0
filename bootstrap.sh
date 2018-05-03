#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev sqlite3 libsqlite3-dev -y

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get update && sudo apt-get install -y nodejs

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

git clone https://github.com/rbenv/rbenv.git ~/.rbenv

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

source ~/.bashrc

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

sudo -H -u vagrant bash -i -c  "rbenv install --verbose 2.5.0"
sudo -H -u vagrant bash -i -c  "rbenv global 2.5.0"

sudo -H -u vagrant bash -i -c  "gem install bundler"

sudo -H -u vagrant bash -i -c  "gem install rails -v 5.2.0"

sudo -H -u vagrant bash -i -c  "rbenv rehash"

if [ ! -d "/vagrant/environment" ]; then
  mkdir /vagrant/environment
fi
