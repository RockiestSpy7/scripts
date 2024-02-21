#!/bin/bash
dnf update
dnf install nginx
systemctl enable --now nginx
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --reload
