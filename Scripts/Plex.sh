#-------------------------------------------------------#
# Install and Configure a Plex Media Server on CentOS 8 #
#-------------------------------------------------------#

## Official Documentation https://support.plex.tv/articles/200264746-quick-start-step-by-step-guides/

# Update system packages
sudo yum update -y

# Download Plex Media Server RPM package
curl -O https://downloads.plex.tv/plex-media-server-new/1.32.8.7639-fb6452ebf/redhat/plexmediaserver-1.32.8.7639-fb6452ebf.x86_64.rpm

# Install Plex Media Server
sudo yum install plexmediaserver-1.32.8.7639-fb6452ebf.x86_64.rpm

# Enable Plex Media Server service and start it
sudo systemctl enable --now plexmediaserver

# Create directory for storing Plex Media Server media files
cd ~
mkdir -p Plex-Media/movies

# Allow Plex Media Server port (default: 32400) through firewall
sudo firewall-cmd --zone=public --add-port=32400/tcp --permanent
sudo firewall-cmd --reload

# Test your Plex Media Server now by putting the IP address in your browser
# Example: http://192.168.1.1:32400
