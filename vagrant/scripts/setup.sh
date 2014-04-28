#!/bin/bash -e

# Disable CDROM entries to prevent apt-get from prompting to insert a disk
sed -i "/^deb cdrom:/s/^/#/" /etc/apt/sources.list

date > /etc/vagrant_box_build_time
