#!/bin/bash -e

echo 'libssl1.0.0:amd64 libraries/restart-without-asking boolean true' | debconf-set-selections

apt-mark hold linux-image-`uname -r`
# https://www.digitalocean.com/community/questions/can-t-seem-to-load-fuse-module
[[ $PACKER_BUILDER_TYPE =~ digitalocean ]] && apt-mark hold fuse

apt-get update
apt-get dist-upgrade -y

apt-mark unhold linux-image-`uname -r`
[[ $PACKER_BUILDER_TYPE =~ digitalocean ]] && apt-mark unhold fuse

apt-get remove -y linux-image-amd64
