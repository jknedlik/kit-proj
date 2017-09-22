#!/bin/bash

sudo mkdir /etc/af-xrootd
sudo mv /home/vagrant/af-xrootd/xrootd_0.cf /etc/af-xrootd/
sudo apt-get --yes update
sudo apt-get --yes upgrade
sudo dpkg -i af-xrootd.deb
sudo apt-get --yes install -f

sudo echo "This is a testfile" > /tmp/Testfile.test
