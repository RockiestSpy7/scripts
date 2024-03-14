#!/bin/bash

# Outputs the uptime, amount of free memory,
# and free disk space on the root system

echo "System Load: $(uptime)"
echo "Free Memory: $(free -h | grep Mem | awk '{print $4}')"
echo "Free Disk Space: $(df -h / | grep / | awk '{print $4}')"