#!/bin/bash -e

echo 'libssl1.0.0:amd64 libraries/restart-without-asking boolean true' | debconf-set-selections

apt-get -y update
apt-get -y dist-upgrade
apt-get clean
