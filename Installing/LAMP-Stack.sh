#!/bin/bash
# Installs Appache, MySQL, and Php on RHEL 9
sudo dnf update -y
sudo dnf install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --reload
sudo dnf install -y mysql-server mysql
sudo systemctl enable mysqld
sudo systemctl start mysqld
# Secure the MySQL installation
# sudo mysql_secure_installation 
sudo dnf install -y php php-mysqlnd php-cli
sudo systemctl restart httpd
sudo ex /var/www/html/test.php <<EOF
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