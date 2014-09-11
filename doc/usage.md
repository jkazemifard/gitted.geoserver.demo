# How to use Sysconf

## Install ```sysconf.base```

```
    # mkdir -p /sysconf/actual
    # echo sysconf.base >/sysconf/actual/deps
    # echo / >/sysconf/target
    # cd /sysconf
    # git clone https://github.com/geonef/sysconf.base.git
    # sysconf.base/tree/usr/bin/sysconf compile install update
```

You may now run the command ```sysconf```. As ```ls -l
/usr/bin/sysconf``` says, the ```sysconf``` script itself is a managed
by Sysconf and belong to the ```sysconf.base``` profile.


## Add a file as managed

```
    # sysconf add /etc/bash.bashrc
```
That command moves the file ```/etc/bash.bashrc``` to
```/sysconf/actual/tree/etc/bash.bashrc``` and install a symlink
instead.


## Add a profile from GitHub

Suppose you want the profile:
[sysconf.gitted](https://github.com/geonef/sysconf.gitted) on your
system. You just need to:
```
    # cd /sysconf
    # git clone https://github.com/geonef/sysconf.gitted.git
    # echo sysconf.gitted >>actual/deps
    # sysconf compile install update
```


## Using git-subtree

If you like Git, it is suggested that you make a Git repository of
```/sysconf``` as a whole and treat externally-maintained profiles
with
[git-subtree(1)](https://github.com/git/git/blob/master/contrib/subtree/git-subtree.txt).

Once you have done the ```mkdir /sysconf``` and ```cd``` into it,
initialize it as a Git repository using ```git init .```.

Then instead of doing a ```git clone```, execute:
```
git subtree add -P sysconf.base https://github.com/geonef/sysconf.base.git master
```

Same for the
[*sysconf.gitted*](https://github.com/geonef/sysconf.gitted) profile
if need to, instead of the ```git clone```, do:
```
git subtree add -P sysconf.gitted https://github.com/geonef/sysconf.gitted.git master
```

If you later want to update your ```/sysconf``` repository with
changes in the upstream repository of ```sysconf.base```, run:
```
git subtree pull -P sysconf.base https://github.com/geonef/sysconf.base.git master
```


## Sysconf *without* sysconf

This explains ho to manipulate Sysconf profiles **without the
[../tree/usr/bin/sysconf](Sysconf script)**.

* suppose we want to extract /etc/nginx/shared.conf as part of our sys config:
```
    # mkdir -p /sysconf/actual/tree/etc/nginx
    # mv /etc/nginx/shared.conf /sysconf/actual/tree/etc/nginx/shared.conf && \
        ln -s /sysconf/actual/tree/etc/nginx/shared.conf /etc/nginx/shared.conf
```
* now we have the sysconf profile "actual" in /sysconf/actual
  * that profile has one single file: (/sysconf/actual/tree)/etc/nginx/shared.conf

* we can add other files the same way, that transform it to a GIT repository:
```
    # cd /sysconf/actual
    # git init .
    # git add tree
    # git commit -m "first commit with nginx shared config"
```

* now we want to use a third-party profile named "db.mongodb" as well
  * we check it out in /sysconf/sysconf.db.mongodb: it contains:
    * tree/ : the files to install, like we explained before
    * deps : the list of dependencies, one name per line
    * install.sh : a shell script that must be run after the files have been installed
  * (re-)install "actual" and "sysconf.base" files
```
    # mkdir /sysconf/compiled
    # cp -rs /sysconf/actual/tree/* /sysconf/compiled/
    # cp -rs /sysconf/sysconf.db.mongodb/tree/* /sysconf/compiled/
    # cp -r /sysconf/compiled/* /
```
  * that's it!
    * as you can check, working directly on installed files is fine: the symlink targets a symlink in /sysconf/compiled/ which targets the original file in the sysconf profile, that can be managed by GIT
