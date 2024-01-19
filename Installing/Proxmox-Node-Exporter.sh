#!/bin/bash
# This bash script istalls proxmox node-exporter and then prints out the IP address of the machine
# Create user
useradd -m -s /bin/false node_exporter

# Download and extract node_exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
tar -zxpvf node_exporter-1.7.0.linux-amd64.tar.gz

# Copy node_exporter to /usr/local/bin/
cp node_exporter-1.7.0.linux-amd64/node_exporter /usr/local/bin/

# Set ownership
chown node_exporter:node_exporter /usr/local/bin/node_exporter

# Create systemd service file
echo "[Unit]
Description=Prometheus Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/node_exporter.service

# Reload systemd and start node_exporter service
systemctl daemon-reload
systemctl start node_exporter.service
systemctl enable node_exporter.service

# Configure firewall
firewall-cmd --add-port=9100/tcp --permanent
firewall-cmd --reload

# Get server IP address
ip_address=$(hostname -I | awk '{print $1}')

# Output IP address in Prometheus target format
echo "Prometheus target configuration:"
echo "- targets: ['$ip_address:9100']"
