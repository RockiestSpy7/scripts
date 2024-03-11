### File Hierarchy Standard (FHS)
This documentation is just a simple explanation of what each directory is used for. For a more in depth explanation on the FHS please visite this site below.

### Detailed Documentation of the FHS https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html

    /           # Root directory, the starting point of the file system hierarchy.

    /bin        # Essential user binaries (commands) needed for system boot and repair.

    /boot       # Contains the boot loader files, kernel, and initial ramdisk (initramfs) used during system boot.

    /dev        # Device files representing hardware devices attached to the system.

    /etc        # System configuration files, including system-wide configuration files and startup scripts.

    /home       # Home directories for regular users.

    /lib        # Shared libraries needed by programs in /bin and /sbin.

    /lib64      # 64-bit shared libraries, on systems with a separate directory for 64-bit libraries.

    /media      # Mount points for removable media such as USB drives and CDs.

    /mnt        # Mount points for temporary filesystems or manually mounted devices.

    /opt        # Optional software packages installed by the system administrator.

    /proc       # Virtual filesystem providing access to kernel and process information.

    /root       # Home directory for the root user.

    /run        # Runtime data such as process IDs and UNIX domain sockets.
 
    /sbin       # System binaries (commands) used for system administration tasks.

    /srv        # Site-specific data served by the system, such as web server content.

    /sys        # Virtual filesystem providing access to kernel and system information.

    /tmp        # Temporary files that are not preserved between reboots.

    /usr        # Secondary hierarchy containing non-essential command binaries, libraries, and documentation.

    /var        # Secondary hierarchy containing non-essential command binaries, libraries, and documentation.

