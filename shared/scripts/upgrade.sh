#!/bin/sh

echo 'libssl1.0.0:amd64 libraries/restart-without-asking boolean true' | debconf-set-selections

apt-get update
apt-get dist-upgrade -y
