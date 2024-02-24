# Ansible config https://docs.theforeman.org/3.0/Configuring_Ansible/index-foreman-el.html
# Pre-requisites https://docs.theforeman.org/3.9/Installing_Server/index-katello.html
# Website for install https://docs.theforeman.org/3.9/Quickstart/index-katello.html#repositories-centos-stream-8
# Step 1: Configure repositories for Cent OS 8
dnf clean all
sudo dnf install https://yum.theforeman.org/releases/3.9/el8/x86_64/foreman-release.rpm
sudo dnf install https://yum.theforeman.org/katello/4.11/katello/el8/x86_64/katello-repos-latest.rpm
sudo dnf install https://yum.puppet.com/puppet7-release-el-8.noarch.rpm
sudo dnf config-manager --set-enabled powertools
sudo dnf module enable katello:el8
# Step 2: Installing foreman server packages
sudo dnf update
sudo dnf install foreman-installer-katello
# Step 3: Run the installer
foreman-installer --scenario katello
# Step 4: Open the ports for clients on Foreman server
sudo firewall-cmd --add-port={5647,8000,9090}/tcp --permanent
# Step 5: Allow access to services on Foreman server
sudo firewall-cmd --add-protocols={dns,dhcp,tftp,http,https,puppetmaster} --permanent
# reload firewall to ensure they are applied
sudo firewall-cmd --reload
# verify they are on the list



foreman-rake permission:reset PASSWORD=changeme # change password