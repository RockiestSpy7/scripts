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