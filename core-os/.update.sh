#!/bin/bash

#  variables
stream='testing'

echo 'Downloading list of builds from getfedora.org'
wget https://builds.coreos.fedoraproject.org/streams/$stream.json
version=`grep -o '"release": "[^"]*' $stream.json | grep -o -m 1 '[^"]*$'`
base_url=https://builds.coreos.fedoraproject.org/prod/streams/$stream/builds

echo 'Preparing to download PXE files'
mkdir /srv/tftp/core-os/arm64 /srv/tftp/core-os/amd64

echo 'Downloading ARM64 PXE files'
for filename in kernel-aarch64 initramfs.aarch64.img rootfs.aarch64.img; do
    wget $base_url/${version}/aarch64/fedora-coreos-${version}-live-$filename
    mv *-$filename /srv/tftp/core-os/arm64/$filename
done

echo 'Downloading AMD64 PXE files'
for filename in kernel-x86_64 initramfs.x86_64.img rootfs.x86_64.img; do
    wget $base_url/${version}/x86_64/fedora-coreos-${version}-live-$filename
    mv *-$filename /srv/tftp/core-os/amd64/$filename
done

rm -rf $stream.json