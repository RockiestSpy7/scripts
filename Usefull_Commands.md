### 1. SYSTEM INFORMATION

        $ uname -a                              # Display Linux system information
        $ uname -r                              # Display kernel release information
        $ cat /etc/os-release                   # Show operating system information such as distribution name and version
        $ uptime                                # Show how long the system has been running + load
        $ hostname                              # Show system host name
        $ hostname -I                           # Display all local IP addresses of the host
        $ last reboot                           # Show system reboot history
        $ date                                  # Show the current date and time
        $ cal                                   # Show this month's calendar
        $ w                                     # Display who is online
        $ whoami                                # Who you are logged in as

### 2. HARDWARE INFORMATION

        $ dmesg                                 # Display messages in kernel ring buffer
        $ cat /proc/cpuinfo                     
        $ cat /proc/meminfo                     
        $ free -h                               
        $ lspci -tv                             
        $ lsusb -tv                             
        $ dmidecode                             
        $ hdparm -i /dev/sda                    
        $ hdparm -tT /dev/sda                   
        $ badblocks -s /dev/sda                 

### 3. PERFORMANCE MONITORING AND STATISTICS

        $ top                                   
        $ htop                                  
        $ mpstat 1                              
        $ vmstat 1                              
        $ iostat 1                              
        $ tail -100 /var/log/messages           
        $ tcpdump -i eth0                       
        $ tcpdump -i eth0 'port 80'             
        $ lsof                                  
        $ lsof -u user                  
        $ free -h                               
        $ watch df -h                           

### 4. USER INFORMATION AND MANAGEMENT

        $ id                                    
        $ last                                  
        $ who                                   
        $ w                                     
        $ groupadd test                         
        $ useradd -c "John Smith" -m john       
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 

### 5. FILE AND DIRECTORY COMMANDS

        $  
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 

### 6. PROCESS MANAGEMENT

        $  
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 

### 7. FILE PERMISSIONS

        $  
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 

### 8. NETWORKING

        $  
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 

### 9. ARCHIVES (TAR FILES)

        $  
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 

### 10. INSTALLING PACKAGES

        $  
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 

### 11. SEARCH

        $  
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 

### 12. SSH LOGINS

        $  
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 

### 13. FILE TRANSFERS

        $  
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 

### 14. DISK USAGE

        $  
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 

### 15. DIRECTORY NAVIGATION

        $  
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 

### 16. SECURITY

        $  
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 

### 17. LOGGING AND AUDITING

        $  
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 
        $ 









man
who
chvt
find
nl
sort
wc

# Displays User and Groups the user is apart of
whoami ; groups

# Displays command history
history

# displays the last few lines of a text file
tail
tail -f /var/log/syslog

# Used to query DNS servers to obtain domain name or IP address mapping or other DNS information.
nslookup
# Uused to perform DNS lookups and display the answers that are returned from the DNS servers
dig

id
# stands for "superuser do" and is used to execute commands with elevated privileges.
sudo
# Executes as root
sudo -i

# stands for "switch user" and is used to switch to another user account.
su
# Switches to root user
su -

# displays dynamic real-time information about running processes 
top

# displays the hostname of the system
hostname

# stands for "disk free" and is used to display information about the amount of free disk space on filesystems
df
# -h outputs human readable format
# -T adds a column showing the filesystem type
df -hT

# Executes a command on another machine and prints the output into a file
ssh -t <User>@<ip_address> <command> >> <file_name>.txt

{ echo " " ; echo "==== `date` on `hostname` ====" ; df -hT ; }

{ echo " " ; echo "==== `date` on `hostname` ====" ; df -hT ; } > `hostname`-health.txt

find /etc -maxdepth 1 -iname "*.*" -exec du -sh {} \; | sort -h
