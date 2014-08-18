#!/bin/bash

##
# Purge unnecessary data from the image to keep it small.
#
# Based on: https://gist.github.com/adrienbrault/3775253
##

#Adding atom launcher to Vagrant users unity bar
echo "Adding the atom editor to the main desktop bar"
cp /usr/share/applications/atom.desktop /home/vagrant/.local/share/applications/

# Remove amazon lens
echo "Removing non-required packages"
sudo apt-get purge thunderbird libreoffice-* rythmbox unity-webapps-common unity-lens-friends unity-lens-photos unity-lens-music unity-lens-video -y

# tidy up DCHP leases
echo "Cleaning up dhcp..."
sudo rm /var/lib/dhcp/*

# make sure Udev doesn't block our network
# http://6.ptmc.org/?p=164
echo "Cleaning up udev..."
sudo rm /etc/udev/rules.d/70-persistent-net.rules
sudo mkdir /etc/udev/rules.d/70-persistent-net.rules
sudo rm -rf /dev/.udev/
sudo rm /lib/udev/rules.d/75-persistent-net-generator.rules

# clean up apt
echo "Cleaning up apt..."
sudo apt-get -qy autoremove
sudo apt-get clean -qy
sudo apt-get autoclean -qy

# nuke the bash history
echo "Removing bash history..."
unset HISTFILE
sudo rm -f /root/.bash_history
rm -f /home/vagrant/.bash_history

#emptying vagrant home
rm -fr /home/vagrant/*

# clean up the logs
echo "Cleaning up logs..."
sudo find /var/log -type f | while read f; do echo -ne "" | sudo tee $f; done;

# zero any and all free space
echo "Cleaning free space..."
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY

# whiteout root
echo "Cleaning up /..."
#count=`df --sync -kP / | tail -n1  | awk -F ' ' '{print $4}'`;
sudo dd if=/dev/zero of=/tmp/whitespace bs=1024;
sudo rm -f /tmp/whitespace;

# whiteout /boot
echo "Cleaning up /boot..."
#count=`df --sync -kP /boot | tail -n1 | awk -F ' ' '{print $4}'`;
sudo dd if=/dev/zero of=/boot/whitespace bs=1024;
sudo rm -f /boot/whitespace;

# whiteout the swap
#echo "Cleaning up swap partitions..."
#sudo swapoff `cat /proc/swaps | tail -n1 | awk -F ' ' '{print $1}'`;
#sudo dd if=/dev/zero of=`cat /proc/swaps | tail -n1 | awk -F ' ' '{print $1}'`;
#sudo mkswap `cat /proc/swaps | tail -n1 | awk -F ' ' '{print $1}'`;
#sudo swapon `cat /proc/swaps | tail -n1 | awk -F ' ' '{print $1}'`;
