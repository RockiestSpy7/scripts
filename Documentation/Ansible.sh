#-------------------------------------------#
# Install and Configure Ansible on CentOS 8 #
#-------------------------------------------#

## Official Documentation -- https://docs.ansible.com/ansible/2.9/installation_guide/intro_installation.html

sudo yum update -y

sudo yum install -y epel-release

sudo yum install -y ansible

adduser ansible

passwd ansible

sudo visudo

# Add this below %wheel ALL=(ALL) ALL to allow the ansible group sudo privilages
%ansible    ALL=(ALL)   ALL