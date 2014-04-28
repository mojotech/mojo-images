#!/bin/sh

apt-get install -y kexec-tools

mv /tmp/files/kexeced.sh /etc/init.d
chmod 755 /etc/init.d/kexeced.sh
ln -s ../init.d/kexeced.sh /etc/rcS.d/S00kexeced.sh
