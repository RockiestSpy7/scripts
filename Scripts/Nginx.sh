#---------------------------------------------------#
# Install and Configure Nginx Webserver on CentOS 8 #
#---------------------------------------------------#

## Bash Script ##

## Official English Documentation: http://nginx.org/en/docs/ ##

# Update system packages
dnf update -y

# Install Nginx
dnf install -y nginx

# Enable and start Nginx service
systemctl enable --now nginx

# Allow HTTP and HTTPS traffic through firewall
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --zone=public --add-service=https --permanent
firewall-cmd --reload

# Backup original configuration file
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bk

# put the IP of the Nginx server into a web browser to test if its working correctly

# Change to the Nginx HTML directory and download your website files
cd /usr/share/nginx/html && wget <insert_github_link>
