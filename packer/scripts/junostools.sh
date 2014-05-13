#!/bin/bash

echo "Install PyEZ"
sudo /usr/bin/pip install junos-eznc

echo "Install Ruby Gems"
sudo gem install nokogiri -- --use-system-libraries
sudo gem install junos-ez-stdlib
sudo gem install junos-ez-srx

echo "Install Atom Text Editor"
sudo add-apt-repository ppa:webupd8team/atom -y
sudo apt-get update
sudo apt-get install atom

echo "Install Packer"
wget https://dl.bintray.com/mitchellh/packer/0.6.0_linux_amd64.zip
sudo unzip 0.6.0_linux_amd64.zip -d /usr/bin
