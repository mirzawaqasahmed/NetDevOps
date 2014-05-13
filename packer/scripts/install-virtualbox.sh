#!/bin/bash

# Mount the disk image
cd /tmp
mkdir /tmp/isomount
sudo mount -t iso9660 -o loop /home/vagrant/VBoxGuestAdditions.iso /tmp/isomount

# Install the drivers
sudo /tmp/isomount/VBoxLinuxAdditions.run

# Cleanup
sudo umount isomount
rm -rf isomount /vagrant/VBoxGuestAdditions.iso
