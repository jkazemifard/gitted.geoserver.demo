/etc/hosts.d/ - directory that let /etc/hosts content be spread into multiple files

All files in the directory that end with ".hosts"
will be concatenated into /etc/hosts by the 'nef-update-hosts' command.


This is part of the "sysconf.base" package that helps normalizing and sharing
system configurations around simple "sysconf profiles" with minimal dependency management.
