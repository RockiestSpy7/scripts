#---------------------------------------------------------#
# Install and Configure HaProxy Load Balancer on CentOS 8 #
#---------------------------------------------------------#

#---------------------------------------------------------#
# WARNING: Before proceeding, customize this file to     #
# match your specific environment and requirements.       #
# Failure to do so may result in misconfiguration or     #
# unintended consequences.                                #
#---------------------------------------------------------#

# Edit the hosts file to map IP addresses to hostnames
vi /etc/hosts
# Adjust the IP addresses and Hostnames to your needs.
192.168.40.10    haproxy-centos8
192.168.40.11    httpd-node01
192.168.40.12    httpd-node02

# Update system packages
sudo dnf update

# Install HaProxy
dnf install -y haproxy

# Create a backup of the haproxy configuration file
cd /etc/haproxy/
cp haproxy.cfg haproxy.cfg-bk

# Edit the haproxy configuration file
vi haproxy.cfg
# Adjust the IP addresses and Hostnames to your needs.
# Configure frontend and backend settings
frontend http_balancer
    bind 192.168.40.10:80
    option http-server-close
    option forwardfor
    stats uri /haproxy?stats
    default_backend     nginx_webservers

backend nginx_webservers
    mode        http
    balance     roundrobin
    option httpchk HEAD / HTTP/1.1rnHost: localhost    
    server  nginx-node01  192.168.40.11:80  check
    server  nginx-node02  192.168.40.12:80  check

# Configure rsyslog for HAProxy logging.
vi /etc/rsyslog.conf
# Uncomment these two lines to enable UDP logging
module(load="imudp")
input(type="imudp" port="514")

# Create haproxy.conf file for rysyslog
vi /etc/rsyslog.d/haproxy.conf
# Specify log file locations for HAProxy
local2.=info     /var/log/haproxy-access.log
local2.notice    /var/log/haproxy-info.log

# Restart and enable rysyslog
systemctl restart rsyslog
systemctl enable rsyslog

# Set SELinux rule for HaProxy
setsebool -P haproxy_connect_any 1

# Start Apache and Enable Auto-start
systemctl enable --now haproxy

# Allow port 80 on the firewall for HaProxy
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --reload