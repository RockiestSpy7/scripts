#!/bin/bash
# Use subscription-manager if you have a paid or tial of redhat subscription
subscription-manager register

# If you want to play around and install software you can mount your redhat ISO image and make it your default local repository and be able to install software.
# To enable your local repository and thus overcome the There are no enabled repos error, first mount your RHEL iso image.
mkdir /media/rhel-iso
mount /dev/cdrom /media/rhel-iso/
# Now when you have your RHEL iso mounted in /media/rhel-iso/, create a new dnf repo file at /etc/yum.repos.d/RHEL_Disc.repo with the following content
vi /etc/yum.repos.d/RHEL_Disc.repo
# [RHEL_Disc]
# name=rhel-8.5-x86_64-dvd
# baseurl="file:///media/rhel-iso/AppStream/"
# gpgcheck=0

# or for bash script
ex /etc/yum.repos.d/RHEL_Disc.repo <<EOF
i
[RHEL_Disc]
name=rhel-8.5-x86_64-dvd
baseurl="file:///media/rhel-iso/AppStream/"
gpgcheck=0
.
wq
EOF

# Check for your repolist
dnf repolist