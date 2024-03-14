# Install and Configure DokuWiki on CentOS 8 #

# Official Documentation -- https://www.dokuwiki.org/install:centos

sudo yum -y update
sudo yum -y install httpd
sudo firewall-cmd --permanent --zone=public --add-service={http,https}
sudo firewall-cmd --reload
sudo dnf module reset php -y
sudo dnf module install php:8.0 -y
sudo yum -y install php php-{cli,common,gd,mbstring,mysqlnd,xml}
php -v # Check Version
wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
sudo tar zxvf dokuwiki-stable.tgz -C /var/www/html/ --strip-components=1
cd /var/www/html
sudo cp .htaccess.dist .htaccess
sudo chown -R apache:apache /var/www/html
semanage permissive -a httpd_t
sudo semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/html/dokuwiki/conf(/.*)?"
sudo semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/html/dokuwiki/data(/.*)?"
sudo restorecon -Rv /var/www/html/dokuwiki/conf
sudo restorecon -Rv /var/www/html/dokuwiki/data
sudo systemctl enable --now httpd
# Change AllowOverride None to AllowOveride All
# under <Directory "/var/www/html">
# Test if it worked by puting this in the web browser
# http://yourserver.com/data/pages/wiki/dokuwiki.txt
# If it denys you access then you have secured DokuWiki


# How to install it on Amazon Linux 2
sudo yum -y update
sudo yum -y install httpd
sudo amazon-linux-extras enable php8.0
sudo yum clean metadata
sudo yum -y install php php-{cli,common,gd,mbstring,mysqlnd,xml}
wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
sudo tar zxvf dokuwiki-stable.tgz -C /var/www/html/ --strip-components=1
cd /var/www/html
sudo cp .htaccess.dist .htaccess
sudo chown -R apache:apache /var/www/html
sudo systemctl enable --now httpd
# Check your .htaccess file and ensure it has this in it
<IfModule !mod_authz_core.c>
  Order deny,allow
  Deny from all
</IfModule>
<IfModule mod_authz_core.c>
  Require all denied
</IfModule>

sudo vim /etc/httpd/conf/httpd.conf
# Change AllowOverride None to AllowOveride All
# under <Directory "/var/www/html">
# Test if it worked by puting this in the web browser
# http://yourserver.com/data/pages/wiki/dokuwiki.txt
# If it denys you access then you have secured DokuWiki


# Add A record in DNS server and name it wiki.
# point it towards the IP of the dokuwiki server

# Add SSL Certificate to Doku Wiki
yum -y update
yum -y install mod_ssl
# Make a new directory or use /var/www/html
sudo vi /etc/httpd/conf.d/domain-name.conf
# Enter this
<VirtualHost *:80>
ServerAdmin admin@test.com
DocumentRoot "/var/www/html"
ServerName domain-name.com
ServerAlias www.domain-name.com
ErrorLog "/var/log/httpd/test.error_log"
CustomLog "/var/log/httpd/test.access_log" common
</VirtualHost>

chown -R apache:apache /var/www/html
yum -y install epel-release # For Amazon Linux 2 use "sudo amazon-linux-extras install epel"
yum -y install yum-utils
yum -y install certbot-apache
# Before running certbot, ensure that port 80 is open
# and make sure DNS server is configured with A record
certbot
# Check website to ensure its working correctly