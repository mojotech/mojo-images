#!/bin/bash -e

yes 'Yes, do as I say!' | apt-get -t wheezy-backports install --force-yes -y --no-install-recommends systemd-sysv
