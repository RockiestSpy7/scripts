#!/bin/bash
mkdir /media/rhel-iso
mount /dev/cdrom /media/rhel-iso/
ex /etc/yum.repos.d/RHEL_Disc.repo <<EOF
i
[RHEL_Disc]
name=rhel-9.3-x86_64-dvd
baseurl="file:///media/rhel-iso/AppStream/"
gpgcheck=0
.
wq
EOF
dnf repolist