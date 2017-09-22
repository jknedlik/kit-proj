#!/bin/bash

export XRD_PLUGIN="/usr/lib/af-xrootd/XrdProxyPrefix.so"
export XRD_DEFAULT_PLUGIN_CONF="/home/vagrant/XrdProxyDefault.conf"
export XRD_LOGLEVEL="Dump"

xrdcp root://143.100.1.200:1094///tmp/Testfile.test ./tfile
cat tfile
rm tfile
