### File Hierarchy Standard (FHS)
This documentation is just a simple explanation of what each directory is used for. For a more in depth explanation on the FHS please visite this site below.

### Detailed Documentation of the FHS https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html

    /                           # Root directory, the starting point of the file system hierarchy.

    /bin                        # Essential user binaries (commands) needed for system boot and repair.

    /boot                       # Contains the boot loader files, kernel, and initial ramdisk (initramfs) used during system boot.

    /dev                        # Device files representing hardware devices attached to the system.

    /etc                        # System configuration files, including system-wide configuration files and startup scripts.
        /etc/opt                # Configuration files for optional software packages installed in /opt.
        /etc/X11 (OPTIONAL)     # Configuration files for the X Window System.
        /etc/sgml (OPTIONAL)    # SGML (Standard Generalized Markup Language) configuration files.
        /etc/xml (OPTIONAL)     # XML (eXtensible Markup Language) configuration files.

    /home (OPTIONAL)            # Home directories for regular users.

    /lib                        # Shared libraries needed by programs in /bin and /sbin.

    /lib<qual> (OPTIONAL)       #

    /media                      # Mount points for removable media such as USB drives and CDs.

    /mnt                        # Mount points for temporary filesystems or manually mounted devices.

    /opt                        # Optional software packages installed by the system administrator.

    /proc                       # Virtual filesystem providing access to kernel and process information.

    /root (OPTIONAL)            # Home directory for the root user.

    /run                        # Runtime data such as process IDs and UNIX domain sockets.
 
    /sbin                       # System binaries (commands) used for system administration tasks.

    /srv                        # Site-specific data served by the system, such as web server content.

    /sys                        # Virtual filesystem providing access to kernel and system information.

    /tmp                        # Temporary files that are not preserved between reboots.

    /usr                        # Secondary hierarchy containing non-essential command binaries, libraries, and documentation.
    /usr/bin                    # Directory containing user binaries (commands).
    /usr/iclude                 # Header files used for compiling software.
    /usr/lib                    # Library files used by user binaries.
    /usr/libexec (OPTIONAL)     # Executable files used internally by some programs.
    /usr/lib<qual> (OPTIONAL)   
    /usr/local                  # Directory for locally-installed software and related files.
    /usr/local/share            # Shared data used by locally-installed software.
    /usr/sbin                   # Directory containing system administration binaries.
    /usr/share                  # Directory containing architecture-independent data files.
    /usr/share/color (OPTIONAL) # Color configuration files.
    /usr/share/dict (OPTIONAL)  # Word lists for spell checkers.
    /usr/share/man              # Manual pages for commands and utilities.
    /usr/share/misc             # Miscellaneous data files.
    /usr/share/ppd (OPTIONAL)   # PostScript Printer Description files.
    /usr/share/sgml (OPTIONAL)  # SGML (Standard Generalized Markup Language) data files.
    /usr/share/xml (OPTIONAL)   # XML (eXtensible Markup Language) data files.
    /usr/src (OPTIONAL)         # Source code files for the Linux kernel and related components.

    /var                        # Secondary hierarchy containing non-essential command binaries, libraries, and documentation.
    /var/account (OPTIONAL)     # System accounting data.
    /var/cache                  # Cache data, including cached files from programs and package managers.
    /var/cache/fonts (OPTIONAL) # Cached font files.
    /var/cache/man (OPTIONAL)   # Cached manual pages.
    /var/crash (OPTIONAL)       # Crash dump files.
    /var/games (OPTIONAL)       # Data files for games.
    /var/lib                    # Variable data files, including databases and state information for programs.
    /var/lib/<editor> (OPTIONAL)# Editor-specific data files.
    /var/lib/color (OPTIONAL)   # Color configuration files.
    /var/lib/hwclock (OPTIONAL) # Hardware clock data.
    /var/lib/misc               # Miscellaneous system data files.
    /var/lock                   # Lock files.
    /var/log                    # Log files.
    /var/mail (OPTIONAL)        # Log files.
    /var/opt                    # Variable data files for optional software packages.
    /var/run                    # Runtime data, such as process IDs and UNIX domain sockets.
    /var/spool                  # Spool directories for print queues, mail, and other services.
    /var/spool/lpd              # Spool directory for print jobs.
    /var/spool/rwho             # Spool directory for rwho (remote who) information.
    /var/tmp                    # Temporary files preserved between reboots.
    /var/yp                     # Network information service (NIS) database files.

