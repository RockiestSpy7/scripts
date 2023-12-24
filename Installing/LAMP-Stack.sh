#!/bin/bash
# Install on RHEL 9
dnf update -y
dnf install -y httpd
systemctl enable httpd
systemctl start httpd
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload
dnf install -y mysql-server mysql
systemctl enable mysqld
systemctl start mysqld
# Secure the MySQL installation
# sudo mysql_secure_installation 
dnf install -y php php-mysqlnd php-cli
systemctl restart httpd
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