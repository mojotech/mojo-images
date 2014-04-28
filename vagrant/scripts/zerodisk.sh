#!/bin/bash

# Zero out the free space to save space in the final image
set +e
dd if=/dev/zero of=/EMPTY bs=1M
set -e
sync
rm -vf /EMPTY
sync
