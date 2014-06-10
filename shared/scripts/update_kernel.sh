#!/bin/bash -e

apt-get ${KERNEL_RELEASE+-t $KERNEL_RELEASE} install -y --no-install-recommends linux-image-${KERNEL_VERSION}
