#!/bin/bash
# Install on CentOS 8
# Updates software to latest patched version
dnf update -y

# Installs Apache web service
dnf install -y httpd

# Enables the service so it starts upon reboot
systemctl enable httpd

# starts the httpd service to continue with installation/setup
systemctl start httpd


# Allow port 80 through the firewall and reload it
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload

# Installs the MySQL server, client, and dependencies
# Optionally, you can make your MySQL installation more secure by supplying a password for the MySQL root user, removing 
# anonymous users, preventing the MySQL root user from logging in remotely, and removing the test database. 
dnf install -y mysql-server mysql

# Enable and start the MySQL server service:
systemctl enable mysqld
systemctl start mysqld

# Secure the MySQL installation
sudo mysql_secure_installation 

# Installs PHP, the MySQL native driver components for PHP, the PHP CLI package, and dependencies
# php-cli is a security risk so ensure not to leave your php-cli scripts in either your web-accessible directories or with open permissions where anyone can execute them.
dnf install -y php php-mysqlnd #php-cli

# Restart Apache after installing php
systemctl restart httpd

# Create the test.php file to test if php is working
ex /var/www/html/test.php <<EOF
i
<?php
phpinfo();
?>
.
wq
EOF

# Open your browser and enter http://<your IP-address>/test.php
# The test.php file contains the phpinfo command, which displays PHP, MySQL, Apache, and other component information complete with version numbers. 
# Remove this file once you have checked it. Hackers look for files containing this information.

# Congratulations, you now have a fully functioning LAMP server.
# Place your PHP and HTML files in /var/www/html, or any web-enabled directory of your choice.
# Remember to place your command-line PHP scripts in your home directory and remove all permissions from others.