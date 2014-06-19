#!/bin/bash -e

if [[ $PACKER_BUILDER_TYPE =~ vmware ]] || [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
  date > /etc/vagrant_box_build_time
fi

if [[ $PACKER_BUILDER_TYPE =~ amazon ]]; then
  # cloud-init adds a swap mount with the nobootwait option...
  # ...which debian doesn't support, so remove it.
  echo Removing broken fstab entries
  sed -i '/\/dev\/xvdb/d' /etc/fstab
fi

mv /tmp/config/motd /etc/
