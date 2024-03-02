#-------------------------------------------#
# Install and Configure Appache on CentOS 8 #
#-------------------------------------------#

# Update System Packages
yum update -y

# Install Apache
yum install -y httpd

# Navigate to the Apache web root directory
cd /var/www/html

# Download your web content from GitHub
wget <insert_github_link>

# Start Apache and Enable Auto-start
systemctl enable --now httpd 

# Allow incoming traffic on ports 80 (HTTP) and 443 (HTTPS)
firewall-cmd --zone=public --add-port={80,443}/tcp --permanent
firewall-cmd --reload
