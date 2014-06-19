#!/bin/bash -e

echo "Removing any old kernels..."
apt-get remove -y $(dpkg --list 'linux-image-*-amd64' | grep ^.i | grep -v `uname -r` | awk '{print $2}')

if [[ $PACKER_BUILDER_TYPE =~ vmware ]] || [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
  # Make sure Udev doesn't block our network
  # http://6.ptmc.org/?p=164
  echo "cleaning up udev rules"
  rm -rf /dev/.udev/
  rm /lib/udev/rules.d/75-persistent-net-generator.rules

  echo "Adding a 2 sec delay to the interface up, to make the dhclient happy"
  echo "pre-up sleep 2" >> /etc/network/interfaces

  if [ -d "/var/lib/dhcp" ]; then
      # Remove leftover leases and persistent rules
      echo "cleaning up dhcp leases"
      rm /var/lib/dhcp/*
  fi
fi

rm -rf /tmp/*
rm -rf /var/lib/apt/lists/*
apt-get clean
