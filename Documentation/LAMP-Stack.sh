#-----------------------------------------------------------------------------#
# Install and Configure a LAMP (Linux, Appache, MySQL, Php) stack on CentOS 8 #
#-----------------------------------------------------------------------------#

# Updates software to latest patched version
dnf update -y

# Installs Apache web service
dnf install -y httpd

# Start Apache and Enable Auto-start
systemctl enable --now httpd

# Allow port 80 on the firewall for Appache
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload

# Install the MySQL server, client, and dependencies
# Optionally, you can make your MySQL installation more secure by supplying a password for the MySQL root user, removing 
# anonymous users, preventing the MySQL root user from logging in remotely, and removing the test database. 
dnf install -y mysql-server mysql

# Enable and start the MySQL server service:
systemctl enable --now mysqld

# Secure the MySQL installation
sudo mysql_secure_installation 

# Install PHP, the MySQL native driver components for PHP, and dependencies
dnf install -y php php-mysqlnd

# Restart Apache after installing php
systemctl restart httpd

# Create the test.php file to test if php is working
vi /var/www/html/test.php
i
<?php
phpinfo();
?>

# Open your browser and enter http://<your IP-address>/test.php
# The test.php file contains the phpinfo command, which displays PHP, MySQL, Apache, and other component information complete with version numbers. 
# Remove this file once you have checked it. Hackers look for files containing this information.

# Congratulations, you now have a fully functioning LAMP server.
# Place your PHP and HTML files in /var/www/html, or any web-enabled directory of your choice.
# Remember to place your command-line PHP scripts in your home directory and remove all permissions from others.