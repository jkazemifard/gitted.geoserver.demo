
# SYSCONF

## A way to manage configuration files

Suppose you have file, ```/etc/cron.daily/some-task```, that you need
to share across different systems:
```
-rw-r--r-- 1 root root 608 2014-08-14 21:28 /etc/cron.daily/some-task
```

The idea is to move the file to a central, versionned, tree in ```/sysconf```, and
replace ```/etc/cron.daily/some-task``` with a symbolic link pointing
to it:
```
lrwxrwxrwx 1 root root 608 2014-08-14 21:28 /etc/cron.daily/some-task -> /sysconf/actual/tree/etc/cron.daily/some-task
-rw-r--r-- 1 root root 608 2014-08-14 21:28 /sysconf/actual/tree/etc/cron.daily/some-task
```

With this organisation, the ```/sysconf``` directory can be
versionned, backed-up and synced between different systems.

And still, files can be edited in place as usual
(```/etc/cron.daily/some-task``` in this example) while being
tracked easily in ```/sysconf```, because of the symbolic links.

### Separating between profiles

In most cases, it is not enough to make a binary separation between
*system*-maintained files (managed by *apt-get*, *yum*, etc.) and
custom *sysconf*-maintained files. Any system serves a purpose that
can be structed in different layers.

#### **Example #1**: a professional desktop system for a developer in a team
... can be devided into these layers:
* host-specific: what is unique to this very system, for example
  ```/etc/hosts```; this layer is named: **actual**
* shared with team: what is shared with the colleagues, for example
  a ```/usr/share/git-hook/commit-msg``` script responsible for the
  validation of the team projects' commit messages; this layer is
  named: **team**
* personal settings: what the dev shares with his home computer, for
  example shell aliases in ```/etc/bash.bashrc```; this layer is
  named: **personal**

Profiles lie in their respective directory into ```/sysconf```:
```
-rw-r--r-- 1 root root  523 2014-08-14 21:28 /sysconf/actual/tree/etc/hosts
-rw-r--r-- 1 root root  769 2014-08-14 21:28 /sysconf/sysconf.team/tree/usr/share/git-hook/commit-msg
-rw-r--r-- 1 root root 1421 2014-08-14 21:28 /sysconf/sysconf.personal/tree/etc/bash.bashrc
```


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
