#!/bin/bash -e

if ! id -u $ADMIN_USER >/dev/null 2>&1; then
  useradd $ADMIN_USER -G sudo --create-home
  echo "%$ADMIN_USER ALL=NOPASSWD:ALL" > /tmp/$ADMIN_USER
  chmod 0440 /tmp/$ADMIN_USER
  mv /tmp/$ADMIN_USER /etc/sudoers.d/
fi

mkdir /home/$ADMIN_USER/.ssh
chmod 700 /home/$ADMIN_USER/.ssh

mv /tmp/files/authorized_keys /home/$ADMIN_USER/.ssh/
chmod 600 /home/$ADMIN_USER/.ssh/authorized_keys
chown $ADMIN_USER:$ADMIN_USER -R /home/$ADMIN_USER/.ssh
