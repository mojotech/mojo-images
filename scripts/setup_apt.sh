#!/bin/bash -e

chown -R root:root /tmp/config/apt

mv /tmp/config/apt/preferences /etc/apt/
mv /tmp/config/apt/sources.list /etc/apt/

rm -rf /etc/apt/preferences.d/*
rm -rf /etc/apt/sources.list.d/*

apt-key add /tmp/config/apt/apt.withmojo.com.key
