#!/bin/bash -e

# Enable memory quotas on HMV AMIs with supported kernel versions
if [[ -d "/boot/extlinux" ]] && echo "${KERNEL_VERSION%%-*}" "3.2" | awk '{exit ($1 > $2)}'; then
  sed -ri '/EXTLINUX_PARAMETERS/ s/"(.*)"/"\1 cgroup_enable=memory swapaccount=1"/' /etc/default/extlinux
fi

apt-get install -y --no-install-recommends ${KERNEL_RELEASE+-t $KERNEL_RELEASE} linux-image-${KERNEL_VERSION}

# On AWS HVM AMIs, extlinux won't automatically boot into the new kernel
if [[ -d "/boot/extlinux" ]] && [[ "$KERNEL_VERSION" != `uname -r` ]]; then
  sed -i 's/^default.*$/default l1/g' /boot/extlinux/extlinux.conf
fi

# On DigitalOcean, we don't have direct control over the kernel version...
# ...so we cheat by using kexec to boot into the appropriate kernel.
if [[ $PACKER_BUILDER_TYPE =~ digitalocean ]]; then
  apt-get install -y kexec-tools

  mv /tmp/config/kexeced.sh /etc/init.d
  chmod 755 /etc/init.d/kexeced.sh
  ln -s ../init.d/kexeced.sh /etc/rcS.d/S00kexeced.sh
fi
