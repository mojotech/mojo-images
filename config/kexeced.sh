#!/bin/sh
### BEGIN INIT INFO
# Provides:          kexeced
# Required-Start:
# Required-Stop:
# Default-Start:     S
# Default-Stop:
# Short-Description: Use custom kernel via kexec
# Description:       Digital Ocean doesn't support custom bootloader,
#                    so use kexec to run a custom kernel.
### END INIT INFO

if [ ! -x /sbin/kexec ]; then
    exit
fi

if grep -qv ' kexeced$' /proc/cmdline; then
    kexec --load /vmlinuz --initrd=/initrd.img --append=' root=LABEL=DOROOT ro kexeced' &&
    mount -o ro,remount / &&
    kexec -e
fi
