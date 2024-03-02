#-------------------------------------------#
# Install and Configure FreeIPA on CentOS 8 #
#-------------------------------------------#

# Offical Documentation https://www.freeipa.org/page/Quick_Start_Guide

# Not Finished

vi /etc/hosts
192.168.1.1  freeipa.mydomain.lan

dnf update -y

dnf module enable idm:DL1 -y

dnf distro-sync -y

sudo dnf install freeipa-server
# Add freeipa-server-dns if you want to include DNS

# Must be root user to execute this command
ipa-server-install

firewall-cmd --add-service={http,https,dns,ntp,freeipa-ldap,freeipa-ldaps} --permanent
firewall-cmd --reload

# Change SELINUX=enforcing to SELINUX=permissive
vi /etc/selinux/config



