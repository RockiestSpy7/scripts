#------------------------------------------------------------------------#
# Install and Configure a NFS client and mount a file system on CentOS 8 #
#------------------------------------------------------------------------#

#============#
# NFS CLIENT #
#============#

#!/bin/bash

# Define directory name and server IP address
directory_name="Directory_Name" # Change
server_ip="192.168.40.1" # Change

# Install NFS utilities
yum install -y nfs-utils

# Create the file system directory
mkdir /${directory_name}

# Set permissions for read, write, and execute access
chmod 777 /${directory_name}

# Configure NFS mount by adding an entry to /etc/fstab
echo "$server_ip:/$directory_name /$directory_name nfs  rw 0 0" >> /etc/fstab

# Allow NFS service through firewall
firewall-cmd --add-service=nfs --permanent
firewall-cmd --reload

# Mount file systems defined in /etc/fstab
mount -a

# Display mounted file systems
df