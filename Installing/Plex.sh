#!/bin/bash
# Bash Script for installing and configuring a plex media server on CentOS
sudo yum update
curl -O https://downloads.plex.tv/plex-media-server-new/1.32.8.7639-fb6452ebf/redhat/plexmediaserver-1.32.8.7639-fb6452ebf.x86_64.rpm
sudo yum install plexmediaserver-1.32.8.7639-fb6452ebf.x86_64.rpm
sudo systemctl enable plexmediaserver
sudo systemctl start plexmediaserver
cd ~
mkdir -p Plex-Media/movies
sudo firewall-cmd --zone=public --add-port=32400/tcp --permanent
sudo firewall-cmd --reload
