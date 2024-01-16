#!/bin/bash
# This bash script is used for installing ansible on CentOS 8 which will configure VMs on proxmox
sudo dnf update -y
sudo dnf install sshpass -y
sudo dnf install epel-release -y
sudo dnf install ansible -y
sudo echo "[pvenodes]
192.168.40.20" > inventory
sudo echo "[defaults]
interpereter_python=auto_silent
host_key_checking=False" > ansible.cfg

