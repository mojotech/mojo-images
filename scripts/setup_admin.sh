#!/bin/bash -e

if ! id -u $ADMIN_USER >/dev/null 2>&1; then
  useradd $ADMIN_USER -G sudo --create-home
  echo "%$ADMIN_USER ALL=(ALL:ALL) NOPASSWD:ALL" > /tmp/$ADMIN_USER
  chmod 0440 /tmp/$ADMIN_USER
  mv /tmp/$ADMIN_USER /etc/sudoers.d/
fi

mkdir /home/$ADMIN_USER/.ssh
chmod 700 /home/$ADMIN_USER/.ssh

if [[ $PACKER_BUILDER_TYPE =~ vmware ]] || [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
  mv /tmp/config/vagrant.authorized_keys /home/$ADMIN_USER/.ssh/authorized_keys
elif [[ $PACKER_BUILDER_TYPE =~ digitalocean ]]; then
  mv /tmp/config/digitalocean.authorized_keys /home/$ADMIN_USER/.ssh/authorized_keys
fi

chmod 600 /home/$ADMIN_USER/.ssh/authorized_keys
chown $ADMIN_USER:$ADMIN_USER -R /home/$ADMIN_USER/.ssh
