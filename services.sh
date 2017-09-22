#!/bin/bash

sudo systemctl daemon-reload
sudo adduser aliaf --no-create-home --gecos "" --disabled-password --disabled-login
sudo adduser aliaf vagrant
sudo chown aliaf /var/log/af-xrootd

sudo systemctl stop af-cmsd@0
sudo systemctl stop af-xrootd@0
sudo systemctl start af-cmsd@0
sudo systemctl start af-xrootd@0
