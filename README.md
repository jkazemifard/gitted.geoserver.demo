
# Sysconf: a way to manage system files and configuration

## The ```sysconf``` script

It's a 500-line shell script at [(tree)/usr/bin/sysconf](tree/usr/bin/sysconf) which help performing the commands to manage the sysconf profiles according to the standard, using SSH to clone and pull from remotes. It gets more useful as multiple package and dependencies are used in /sysconf.


### Installation

* Run as root:
```
curl https://raw.githubusercontent.com/geonef/sysconf.base/master/tree/usr/bin/sysconf | bash -s init https://github.com/geonef/sysconf.base.git compile install update
```

* Done! You may now run 'sysconf'. For curiosity:
```
    # ls -l /usr/bin/sysconf
    lrwxrwxrwx 1 root root 40 mai   30 08:51 /usr/bin/sysconf -> /sysconf/sysconf.base/tree/usr/bin/sysconf
```

### Tips

* Add the following to your ~/.gitconfig or system-wise gitconfig (replace "geonef" with any other GitHub user or community you need):
```
    [url "https://github.com/geonef/"]
      insteadOf = sysconf:
```

### Quick FAQ

#### How to uninstall sysconf?

* First, remove all links which have been installed by sysconf:
```
    # find /usr/bin/ /etc/ -type l -lname '/sysconf/*' | xargs rm
```
* Then, remove sysconf itself and it's repositories:
```
    # rm -rf /sysconf
```
