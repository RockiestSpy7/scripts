#!/bin/bash
# This bash script is used to install Appache and configure your website on CentOS 7
sudo yum update -y
sudo yum install -y httpd
sudo cd /var/www/html
sudo wget https://github.com/azeezsalu/jupiter/archive/refs/heads/main.zip # sudo wget <insert_github_link>
sudo unzip main.zip # sudo unzip <zipped_folder_name.zip>
sudo cp -r jupiter-main/* /var/www/html/ # sudo cp -r <unziped_folder_name>/* /var/www/html/
sudo rm -rf jupiter-main main.zip # sudo rm -rf <unziped_folder_name> <zipped_folder_name.zip>
sudo systemctl enable httpd 
sudo systemctl start httpd