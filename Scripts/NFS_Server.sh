#------------------------------------------------------------------------#
# Install and Configure a NFS server and mount a file system on CentOS 8 #
#------------------------------------------------------------------------#

#============#
# NFS SERVER #
#============#

#!/bin/bash

# Define directory name and client IP address
directory_name="Directory_Name" # Change
client_ip="192.168.40.1" # Change

# Install, Enable, and Start the NFS Server
yum install -y nfs-utils
systemctl start nfs-server
systemctl enable nfs-server

# Create the file system directory
mkdir /${directory_name}

# Set permissions for read, write, and execute access
chmod 777 /${directory_name}

# Configure NFS exports by adding an entry to /etc/exports
echo "/$directory_name   $client_ip(rw)" > /etc/exports

# Exports all file systems that are in /etc/exports
exportfs -a

# Display exported file systems
exportfs

# Allow NFS service through firewall
firewall-cmd --add-service=nfs --permanent
firewall-cmd --reload


