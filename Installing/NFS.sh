#!/bin/bash
# This documents shows how to install and configure a NFS server, client, and mount a file system on linux

#============#
# NFS SERVER #
#============#
directory_name="Directory_Name"
client_ip="192.168.40.1"
# Install, Enable, and Start the NFS Server
yum install -y nfs-utils
systemctl start nfs-server
systemctl enable nfs-server

# Create the file system
mkdir /${directory_name}
# Add read, write, and execute access
chmod 777 /${directory_name}
# Prints the following text into the /etc/exports file
echo "/$directory_name   $client_ip(rw)" > /etc/exports
# Exports all file systems that are in /etc/exports
exportfs -a
# Shows your exported file system
exportfs

#!/bin/bash
#============#
# NFS CLIENT #
#============#
directory_name="Directory_Name"
server_ip="192.168.40.1"
# nstall NFS
yum install -y nfs-utils
# Create the file system
mkdir /${directory_name}
# Add read, write, and execute access
chmod 777 /${directory_name}
# Prints this line at the end of the /etc/fstab file
echo "$server_ip:/$directory_name /$directory_name nfs  rw 0 0" >> /etc/fstab
# Mounts the files defined in the /etc/fstab file
mount -a
# Displays the mounted file systems
df