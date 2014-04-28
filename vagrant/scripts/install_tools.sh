#!/bin/bash -eux

if [[ $PACKER_BUILDER_TYPE =~ vmware ]]; then
  echo "Installing VMware Tools"
 oapt-get install -y linux-headers-$(uname -r) build-essential perl


  cd /tmp
  mkdir -p /mnt/cdrom
  mount -o loop /home/$ADMIN_USER/linux.iso /mnt/cdrom
  tar zxf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp/
  /tmp/vmware-tools-distrib/vmware-install.pl -d
  rm /home/$ADMIN_USER/linux.iso
  umount /mnt/cdrom
  rmdir /mnt/cdrom

  apt-get -y remove linux-headers-$(uname -r) build-essential perl
  apt-get -y autoremove
fi

if [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
  echo "Installing VirtualBox guest additions"

  apt-get install -y linux-headers-$(uname -r) build-essential perl
  apt-get install -y dkms

  VBOX_VERSION=$(cat /home/$ADMIN_USER/.vbox_version)
  mount -o loop /home/$ADMIN_USER/VBoxGuestAdditions_${VBOX_VERSION}.iso /mnt
  sh /mnt/VBoxLinuxAdditions.run --nox11
  umount /mnt
  rm /home/$ADMIN_USER/VBoxGuestAdditions_${VBOX_VERSION}.iso

  # Workaround for https://github.com/mitchellh/vagrant/issues/3341
  [[ "${VBOX_VERSION}" == "4.3.10" ]] && \
    ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
fi
