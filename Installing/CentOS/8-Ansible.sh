#!/bin/bash
# This bash script is used for installing ansible on CentOS 8
sudo dnf update -y
sudo dnf install epel-release -y
sudo dnf install ansible -y

