#------------------------------------#
# Installing and configuring BIND DNS#
#------------------------------------#

#---------------------------------------------------------#
# WARNING: Before proceeding, customize this file to     #
# match your specific environment and requirements.       #
# Failure to do so may result in misconfiguration or     #
# unintended consequences.                                #
#---------------------------------------------------------#


# Update the system and install BIND DNS
dnf update -y
dnf install bind bind-utils

# Enable and start the BIND service
systemctl enable --now named

# Check the status of the BIND service
systemctl status named

# Backup the named configuration file
cp /etc/named.conf /etc/named.bk

# Edit the named configuration file to adjust settings
vi /etc/named.conf
# Add // to comment out these two lines to  allow BIND DNS to listen to all IPs
listen-on port 53 { 127.0.0.1; }; 
listen-on-v6 port 53 { ::1; };
# Add your network subnet to the allow-query directive
allow-query { localhost; 192.168.1.0/24; };

# Add forward and reverse zones to the named.conf file
//forward zone
zone "local.lan" IN {
     type master;
     file "local.lan.db";
     allow-update { none; };
     allow-query { any; };
};

//backward zone
zone "1.168.192.in-addr.arpa" IN {
     type master;
     file "local.lan.rev";
     allow-update { none; };
     allow-query { any; };
};

# Creat Forward DNS zone file for your domain
vi /var/named/local.lan.db
# Add DNS resource records for your domain
$TTL 86400
@ IN SOA dns-server.local.lan. admin.local.lan. (
                                                2020011800 ;Serial
                                                3600 ;Refresh
                                                1800 ;Retry
                                                604800 ;Expire
                                                86400 ;Minimum TTL
)

;Name Server Information
@ IN NS dns-server.local.lan.

;IP Address for Name Server
dns-server IN A 192.168.1.2

;Mail Server MX (Mail exchanger) Record
local.lan. IN MX 10 mail.local.lan.

;A Record for the following Host name
www  IN   A   192.168.1.3
mail IN   A   192.168.1.4

;CNAME Record
ftp  IN   CNAME www.local.lan.

# Create reverse DNS zone file for your domain
vim /var/named/linuxtechi.local.rev
# Add reverse DNS resource records for your domain
$TTL 86400
@ IN SOA dns-server.local.lan. admin.local.lan. (
                                            2020011800 ;Serial
                                            3600 ;Refresh
                                            1800 ;Retry
                                            604800 ;Expire
                                            86400 ;Minimum TTL
)
;Name Server Information
@ IN NS dns-server.local.lan.
dns-server     IN      A       192.168.1.2

;Reverse lookup for Name Server
2 IN PTR dns-server.local.lan.

;PTR Record IP address to Hostname
3      IN      PTR     www.local.lan.
4      IN      PTR     mail.local.lan.


# Ensure the DNS zone lookup files are correct
named-checkconf
named-checkzone local.lan /var/named/local.lan.db
named-checkzone 192.168.1.2 /var/named/local.lan.rev

# Restart the named daemon
systemctl restart named

# Allow DNS through the firewall
firewall-cmd  --zone=public --add-service=dns  --permanent
firewall-cmd --reload

# Test the DNS server on another client machine
# Edit the /etc/resolv.conf file and append the nameserver
sudo vi /etc/resolv.conf
nameserver 192.168.1.2

# Append the Bind DNS server's IP address to your network script
sudo vi /etc/sysconfig/network-scripts/ifcfg-enp0s3
DNS=192.168.1.2

# Restart the Network Manager
systemctl restart NetworkManager

# Test your Bind DNS server
nslookup dns-server.local.lan
nslookup 192.168.1.2
dig dns-server.local.lan
dig -x 192.168.1.2