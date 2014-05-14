#!/bin/bash -e

chown -R root:root /tmp/files/apt

apt-key add /tmp/files/apt/apt.withmojo.com.key

mv /tmp/files/apt/apt.withmojo.com.pref /etc/apt/preferences.d/
mv /tmp/files/apt/apt.withmojo.com.list /etc/apt/sources.list.d/
