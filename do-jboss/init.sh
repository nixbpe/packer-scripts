#!/bin/bash

sleep 30

yum -y upgrade
yum -y install vim wget


# Setup swap ~2G
dd if=/dev/zero of=/swapfile bs=1024 count=2048k
mkswap /swapfile
swapon /swapfile
echo "/swapfile          swap            swap    defaults        0 0" >> /etc/fstab
chown root:root /swapfile 
chmod 0600 /swapfile
sysctl vm.swappiness=10 >> /etc/sysctl.conf