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

# Define the line range to replace
line_numbers="67,90"

# Define the new text
new_text="
frontend http_balancer
    bind 192.168.40.10:80
    option http-server-close
    option forwardfor
    stats uri /haproxy?stats

#    acl url_static       path_beg       -i /static /images /javascript /stylesheets
#    acl url_static       path_end       -i .jpg .gif .png .css .js
#    use_backend static          if url_static
    default_backend     nginx_webservers

backend nginx_webservers
    mode        http
    balance     roundrobin
    option httpchk HEAD / HTTP/1.1rnHost: localhost    
    server  nginx-node01  192.168.40.11:80  check
    server  nginx-node02  192.168.40.12:80  check
"
sudo sed -i "${line_range}s/.*/$new_text/" /etc/haproxy/haproxy.cfg-bk2