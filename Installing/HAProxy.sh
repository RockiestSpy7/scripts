#!/bin/bash
# Bash Script for installing and setting up HaProxy Load Balancer on CentOS

# Your new entries to be added (each entry on a new line)
# Adjust the IP addresses and Hostnames to your needs.
hosts="
192.168.40.10    haproxy-centos8
192.168.40.11    httpd-node01
192.168.40.12    httpd-node02
"

# Append the new entries to the end of the hosts file
echo "$hosts" | sudo tee -a /etc/hosts

sudo dnf update

dnf install haproxy

cd /etc/haproxy/
cp haproxy.cfg haproxy.cfg-bk
