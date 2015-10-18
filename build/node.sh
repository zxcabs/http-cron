#!/bin/sh

set -e

#node-gyp dependens from python2, make, g++
apt-get install -y python2.7 make g++ nodejs

ln /usr/bin/python2.7 /usr/bin/python
