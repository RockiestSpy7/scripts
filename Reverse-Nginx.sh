#!/bin/bash
# NOT Finished
# This script installs nginx and sets up the reverse proxy
dnf update
dnf install nginx
systemctl enable --now nginx
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --reload