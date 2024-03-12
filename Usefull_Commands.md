### IF you need more information on a command or need to look up a certain command use these commands

        $ man                                   # Displays the manual pages for commands on linux
        $ man -k                                # Searches manual pages containing a certain keyword
        $ apropos                               # Searches manual pages containing a certain keywordSearch manual pages 
        $ mandb                                 # Updates the manual page index database

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
        $ cat /proc/cpuinfo                     # Display CPU information
        $ cat /proc/meminfo                     # Display memory information
        $ free -h                                Display free and used memory ( -h for human readable, -m for MB, -g for GB.)
        $ lspci -tv                             # Display PCI devices
        $ lsusb -tv                             # Display USB devices
        $ dmidecode                             # Display DMI/SMBIOS (hardware info) from the BIOS
        $ hdparm -i /dev/sda                    # Show info about disk sda
        $ hdparm -tT /dev/sda                   # Perform a read speed test on disk sda
        $ badblocks -s /dev/sda                 # Test for unreadable blocks on disk sda

### 3. PERFORMANCE MONITORING AND STATISTICS

        $ top                                   # Display and manage the top processes
        $ htop                                  # Interactive process viewer (top alternative)
        $ mpstat 1                              # Display processor related statistics
        $ vmstat 1                              # Display virtual memory statistics
        $ iostat 1                              # Display I/O statistics
        $ tail -100 /var/log/messages           # Display the last 100 syslog messages  (Use /var/log/syslog for Debian based systems.)
        $ tcpdump -i eth0                       # Capture and display all packets on interface eth0
        $ tcpdump -i eth0 'port 80'             # Monitor all traffic on port 80 ( HTTP )
        $ lsof                                  # List all open files on the system
        $ lsof -u user                          # List files opened by user
        $ free -h                               # Display free and used memory ( -h for human readable, -m for MB, -g for GB.)
        $ watch df -h                           # Execute "df -h", showing periodic updates

### 4. USER INFORMATION AND MANAGEMENT

        $ id                                    # Display the user and group ids of your current user.
        $ last                                  # Display the last users who have logged onto the system.
        $ who                                   # Show who is logged into the system.
        $ w                                     # Show who is logged in and what they are doing.
        $ groupadd test                         # Create a group named "test".
        $ useradd -c "John Smith" -m john       # Create an account named john, with a comment of "John Smith" and create the user's home directory.
        $ userdel john                          # Delete the john account.
        $ usermod -aG sales john                # Add the john account to the sales group

### 5. FILE AND DIRECTORY COMMANDS

        $ ls -al                                # List all files in a long listing (detailed) format
        $ pwd                                   # Display the present working directory
        $ mkdir directory                       # Create a directory
        $ rm file                               # Remove (delete) file
        $ rm -r directory                       # Remove the directory and its contents recursively
        $ rm -f file                            # Force removal of file without prompting for confirmation
        $ rm -rf directory                      # Forcefully remove directory recursively
        $ cp file1 file2                        # Copy file1 to file2
        $ cp -r source_directory destination    # Copy source_directory recursively to destination. If destination exists, copy source_directory into destination, otherwise create destination with the contents of source_directory.
        $ mv file1 file2                        # Rename or move file1 to file2. If file2 is an existing directory, move file1 into directory file2
        $ ln -s /path/to/file linkname          # Create symbolic link to linkname
        $ touch file                            # Create an empty file or update the access and modification times of file.
        $ cat file                              # View the contents of file
        $ less file                             # Browse through a text file    
        $ head file                             # Display the first 10 lines of file
        $ tail file                             # Display the last 10 lines of file
        $ tail -f file                          # Display the last 10 lines of file and "follow" the file as it grows.

### 6. PROCESS MANAGEMENT

        $ ps                                    # Display your currently running processes
        $ ps -ef                                # Display all the currently running processes on the system.
        $ ps -ef | grep processname             # Display process information for processname
        $ top                                   # Display and manage the top processes
        $ htop                                  # Interactive process viewer (top alternative)
        $ kill pid                              # Kill process with process ID of pid
        $ killall processnam                    # Kill all processes named processname
        $ program &                             # Start program in the background
        $ bg                                    # Display stopped or background jobs
        $ fg                                    # Brings the most recent background job to foreground
        $ fg n                                  # Brings job n to the foreground

### 7. FILE PERMISSIONS

        PERMISSION      EXAMPLE

         U   G   W
        rwx rwx rwx     chmod 777 filename
        rwx rwx r-x     chmod 775 filename
        rwx r-x r-x     chmod 755 filename
        rw- rw- r--     chmod 664 filename
        rw- r-- r--     chmod 644 filename

        # NOTE: Use 777 sparingly!

        LEGEND
        U = User
        G = Group
        W = World

        r = Read
        w = write
        x = execute
        - = no access

        $ chown owner-user file                         # Change owner of the file
        $ chown owner-user:owner-group  file-name       # Change owner and group owner of the file
        $ chown :owner-group file-name                  # Change group owner of the file

### 8. NETWORKING

        $ ip a                                  # Change owner and group owner of the file
        $ ip addr show dev eth0                 # Display eth0 address and details
        $ ethtool eth0                          # Query or control network driver and hardware settings
        $ ping host                             # Send ICMP echo request to host
        $ whois domain                          # Display whois information for domain
        $ dig domain                            # Display DNS information for domain
        $ dig -x IP_ADDRESS                     # Reverse lookup of IP_ADDRESS
        $ host domain                           # Display DNS IP address for domain
        $ hostname -i                           # Display the network address of the host name.
        $ hostname -I                           # Display all local IP addresses of the host.
        $ wget http://domain.com/file           # Download http://domain.com/file
        $ netstat -nutlp                        # Display listening tcp and udp ports and corresponding programs

### 9. ARCHIVES (TAR FILES)

        $ tar cf archive.tar directory          # Create tar named archive.tar containing directory.
        $ tar xf archive.tar                    # Extract the contents from archive.tar.
        $ tar czf archive.tar.gz directory      # Create a gzip compressed tar file name archive.tar.gz.
        $ tar xzf archive.tar.gz                # Extract a gzip compressed tar file.
        $ tar cjf archive.tar.bz2 directory     # Create a tar file with bzip2 compression
        $ tar xjf archive.tar.bz2               # Extract a bzip2 compressed tar file.

### 10. INSTALLING PACKAGES

        $ yum search keyword                    # Search for a package by keyword.
        $ yum install package                   # Install package.
        $ yum info package                      # Display description and summary information about package.
        $ rpm -i package.rpm                    # Install package from local file named package.rpm
        $ rpm -e package                        # Remove package   
        $ yum remove package                    # Remove/uninstall package.
        $ 
        $ tar zxvf sourcecode.tar.gz            # Install software from source code.
        $ cd sourcecode
        $ ./configure
        $ make
        $ make install

### 11. SEARCH

        $ grep pattern file                     # Search for pattern in file
        $ grep -r pattern directory             # Search recursively for pattern in directory
        $ locate name                           # Find files and directories by name
        $ find /home/john -name 'prefix*'       # Find files in /home/john that start with "prefix".
        $ find /home -size +100M                # Find files larger than 100MB in /home

### 12. SSH LOGINS

        $ ssh host                              # Connect to host as your local username.
        $ ssh user@host                         # Connect to host as user
        $ ssh -p port user@host                 # Connect to host using port

### 13. FILE TRANSFERS

        $ scp file.txt server:/tmp              # Secure copy file.txt to the /tmp folder on server
        $ scp server:/var/www/*.html /tmp       # Copy *.html files from server to the local /tmp folder.
        $ scp -r server:/var/www /tmp           # Copy all files and directories recursively from server to the current system's /tmp folder.
        $ rsync -a /home /backups/              # Synchronize /home to /backups/home
        $ rsync -avz /home server:/backups/     # Synchronize files/directories between the local and remote system with compression enabled

### 14. DISK USAGE

        $ df -h                                 # Show free and used space on mounted filesystems
        $ df -i                                 # Show free and used inodes on mounted filesystems
        $ df -hT                                # Includes file system type column
        $ fdisk -l                              # Display disks partitions sizes and types
        $ du -ah                                # Display disk usage for all files and directories in human readable format
        $ du -sh                                # Display total disk usage off the current directory

### 15. DIRECTORY NAVIGATION

        $ cd ..                                 # To go up one level of the directory tree.  (Change into the parent directory.)
        $ cd                                    # Go to the $HOME directory
        $ cd /etc                               # Change to the /etc directory

### 16. SECURITY

        $ passwd                                # Change the current user's password.
        $ sudo -i                               # Switch to the root account with root's environment. (Login shell.)
        $ sudo -s                               # Execute your current shell as root. (Non-login shell.)
        $ sudo -l                               # List sudo privileges for the current user.
        $ visudo                                # Edit the sudoers configuration file.
        $ getenforce                            # Display the current SELinux mode.
        $ sestatus                              # Display SELinux details such as the current SELinux mode, the configured mode, and the loaded policy.
        $ setenforce 0                          # Change the current SELinux mode to Permissive. (Does not survive a reboot.)
        $ setenforce 1                          # Change the current SELinux mode to Enforcing. (Does not survive a reboot.)
        $ SELINUX=enforcing                     # Set the SELinux mode to enforcing on boot by using this setting in the /etc/selinux/config file.
        $ SELINUX=permissive                    # Set the SELinux mode to permissive on boot by using this setting in the /etc/selinux/config file.
        $ SELINUX=disabled                      # Set the SELinux mode to disabled on boot by using this setting in the /etc/selinux/config file.

### 17. LOGGING AND AUDITING

        $ dmesg                                 # Display messages in kernel ring buffer.
        $ journalctl                            # Display logs stored in the systemd journal.
        $ journalctl -u servicename             # Display logs for a specific unit (service).

### 18. Managing Disk Partitions and Mount Points

        $ lsblk -f                              # Lists block devices (-f shows filesystem related details)
        $ fdisk                                 # Allows you to manage disk partitions on Linux systems, allowing users to manipulate disk space allocation according to their requirements.
        $ mkfs                                  # Used for initializing disk partitions or block devices with a filesystem, enabling them to be used for data storage
        $ parted                                # Used for disk partitioning and partition management
        $ findmnt                               # Used to display a list of currently mounted filesystems or search for mounted filesystems based on various criteria
        $ mount                                 # Used to mount filesystems onto a directory in the filesystem hierarchy, making the content of the filesystem accessible to the system and users.
        $ mount -a                              # Used to mount all filesystems listed in the /etc/fstab file that are not already mounted
        $ mkswap                                # used to set up a swap area on a device or partition
        $ swapon -v                             # used to activate swap space on a device or partition (-v verbose mode providing detailed info on swap areas being activated)
        


### Other Commands
        $ chvt                                  #
        $ nl                                    #
        $ sort
        $ wc                                    #
        $ groups                                #
        $ history                               #
        $ nslookup
        $ id
        $ su
        $ xargs                                 # Takes the output of the previous command and inputs it the end the command specified



### Example Commands
        # Executes a command on another computer and outputs it on a file on your computer
        ssh -t <User>@<ip_address> <command> >> <file_name>.txt

        # Outputs disk space on mounted filesystems in a text file with a custom date and hostname at the top
        { echo " " ; echo "==== `date` on `hostname` ====" ; df -hT ; } >> `hostname`-health.txt

        # 
        find /etc -maxdepth 1 -iname "*.*" -exec du -sh {} \; | sort -h

        # Outputs these three names in the passwd, group, and shadow file
        grep 'steve\|jake\|mike' /etc/{passwd,group,shadow}