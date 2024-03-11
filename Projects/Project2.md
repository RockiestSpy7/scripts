# In this project, I will establish a small LAN within my HomeLab environment and setup a Reverse Nginx Proxy that will loadbalance between 2 Appache Servers.

# NOTE: This file serves as documentation and as future reference for myself

# Below are the tools I used along with what they are being used for #
# Pfsense -- Router,Firewall,DHCP,DNS
# Appach -- Web Server
# Reverse Nginx -- Proxy for Appache Webserver




[Install Pfsense]

- Download the Pfsense ISO first from here "https://www.pfsense.org/download/"

- Since Pfsense will be installed on Oracle Virtual Box I will need to change the "Type" to "BSD" and ensure it is the "FreeBSD 64 bit" version.

- Enable 2 network adapters. One as "Bridged" and the other as "Internal". This will allow the VMs in the internal network to access the internet through Pfsense
 - For a safer connection you can change "Bridged" to "NAT Network"

- Once Pfsense is booted up, "Accept" the agreement and select "Install"

- Now partition your disk with "Auto (UFS)".
 - The reason I use "Auto (UFS)" is because it requires little resources and is simple to install. If you have the resources or need redundancy you can choose "Auto (ZFS)" which is a bit more advanced. "Manual" is for if you want more control over the installation process while "Shell" allows you to do everything by hand in the shell prompt.

- Partition the "Entire Disk" since Pfsense is the only OS on this VM

- Select "GPT" for the partition scheme. I use this method because its the most widely compatible choice.

- Review your disk setup and ensure everything is to your liking then select "Finish" and "Commit"

- Once the installation is complete, Poweroff the VM  off and remove the ISO from the VM so it doesnt continously boot into the installer

- Now boot up Pfsense again and it should be up and running.
 - Access the Web Interface by putting the IP address in your web browser
 - User is "admin" and Password is "pfsense"

- In Pfsense Wizard I configured the following:
 - Hostname: Firewall
 - Domain: local.lan (Do not use .local for the top level domain)
 - Disable Override DNS
 - Time Server Hostname: ntp.local.lan
 - Timezone: America/New_York
 - Slected Type: DHCP
 - DHCP Hostname: dhcp.local.lan
 - Disable "Block RFC1918 Private Networks" (Disabled because my WAN in on my home LAN)
 - LAN IP Address: 192.168.1.1
 - Subnet Mask: 24

- Go to "System > Advanced" and select "Networking". Once there select Kea DHCP becuase ISC DHCP is deprecated on Pfsense

- Go to "Services > DHCP Server" and ensure DHCP in enabled
 - Set the "Address Pool Range" for the DHCP Server "192.168.1.10 - 192.168.1.245"
 - "192.168.1.2 - 192.168.1.9" will be reserverved for static ip addresses

- Scroll down to "Server Options" and put the IP address of Pfsense as the DNS server since I will be configuring Pfsenses DNS Resolver.

- After the Setup Wizard is finished select "Services > DNS Resolver" and make sure it is enabled. Make sure to also check "Services > DNS Forwarder" and ensure it is disabled.
 - DNS Resolver will be enable because Pfsense will also be acting as the DNS server while DNS Forwarder is disabled cause I dont have a external DNS server.

- Go to "System > General Setup" and under DNS Server Settings add the upstream DNS servers for cloudflare.
 - Address "1.1.1.1"
 - Hostname "cloudflare-dns.com"
 - Address "1.0.0.1"
 - Hostname "cloudflare-dns.com"

- Ensure DNS Server Overide is disabled
 - I disabled this because I only want to use the DNS servers I manually added

- DNS Resolution Behavior: Use local DNS(127.0.0.1), ignore remote DNS Servers
 - This ensures the firewall only uses the DNS Resolver and ensures it will not attempt to contact the DNS servers directly
 - This also prevents DNS requests from the firewall being leaked unencrypted on port 53 if the resolver is temporarily unavailable

- Go back to "Services > DNS Resolver" and uncheck "Enable DNSSEC Support", check "Enable Forwarding Mode", and Check "Use SSL/TLS for outgoing DNS Queries to Forwarding Servers"
 - The reason for unchecking DNSSEC is not generally compatible with forwarding mode, with or without DNS over TLS
 - Checking "Enable Forwarding Mode" will now only forward DNS queries to the upstream DNS servers we specified above 
 - Checking "Use SSL/TLS for outgoing DNS Queries to Forwarding Servers" will ensure that all queries to the upstream DNS servers will be sent using SSL/TLS on port 853.
 - For this to work all configured forwarding servers MUST support SSL/TLS queries on port 853

- Test DNS over TLS via:
 - "Diagnostics > DNS Lookup" and ensure the DNS servers are working
 - "Diagnostics > States" and ensure port 853 is being used for the DNS server
 - and the last way you can ensure its working correctly is by capturing the packets on port 853 in wireshark and checking if the contents of the DNS query is not visible

- Create a access list in "Services > DNS Resolver > Access Lists" that "Allows" DNS queries within the "192.168.1.0/24" network and create a access list that "Denys Nonlocal" DNS queries outside of the "192.168.1.0/24".
 - Doing this ensures only the LAN can query the DNS Resolver while also reducing the attack surface and increasing privacy of the DNS Resolver by completly droping DNS queries outside of the LAN



 [ Configure the IP and Hostname for the Web Servers and Proxy ]
# Web Server 1
- Staticly assign the IP address using "nmtui"
 - IP: 192.168.1.2
 - Gateway: 192.168.1.1
 - DNS: 192.168.1.1

- hostnamectl set-hostname web1.local.lan
 - reboot the server after this command
 - After rebooting go back to Pfsense "Services > DNS Resolver" and add web1 in "Host Overrides"

 # Web Server 2
- Staticly assign the IP address using "nmtui"
 - IP: 192.168.1.3
 - Gateway: 192.168.1.1
 - DNS: 192.168.1.1

- hostnamectl set-hostname web2.local.lan
 - reboot the server after this command
 - After rebooting go back to Pfsense "Services > DNS Resolver" and add web2 in "Host Overrides"

 # Proxy Server
- Staticly assign the IP address using "nmtui"
 - IP: 192.168.1.4
 - Gateway: 192.168.1.1
 - DNS: 192.168.1.1

- hostnamectl set-hostname proxy1.local.lan
 - reboot the server after this command
 - After rebooting go back to Pfsense "Services > DNS Resolver" and add proxy1 in "Host Overrides"


[ Setup Appache Web Servers ]
# Use this script to configure the appache web servers
#!/bin/bash
yum update -y
yum install -y httpd
cd /var/www/html
echo "If you can see this then the appache web server is working!  > index.html
systemctl enable --now httpd 
firewall-cmd --zone=public --add-service={http,https} --permanent
firewall-cmd --reload

[ Setup Reverse Nginx Proxy Server ]
# Use this script to configure the Reverse Nginx Proxy server
yum update -y
yum install -y nginx
mkdir /etc/nginx/sites-{available,enabled}
vi /etc/nginx/nginx.conf
# include     /etc/nginx/sites-enabled/*;
touch /etc/nginx/sites-available/default.conf
