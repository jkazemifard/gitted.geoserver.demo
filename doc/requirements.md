# Original need and requirements of this project

* See also: [Logic of Sysconf](logic.md), [Home README](../README.md)

## The story

 * As life goes, sysadmins tend to administrate more servers and bigger requirements.

* The question is: how do we put things in common, reuse scripts and configs? Between servers of course, but ideally between people, be it private like colleagues or public like on GitHub

* Additionally, it should provide versionning and backuping

* There are solutions for packaging things. The excellent Debian packaging system. As for changing config there are configuration management software like [Puppet](http://puppetlabs.com/). Or GIT can be used to gather common scripts.

* But wait! There's other needs:

  * **no abstraction!** Abstractions exist to isolate a working logic. Setting up software usually needs platform-level or even network-level work. Abstraction like custom config languages can be risky as it may hide important logic for understanding problems. Instead, we want to rely on the platform distribution: on a GNU/Linux Debian, we would follow their conventions as much as possible.

  * **no pain** for usual work: if the system makes the day more difficult, we won't use it. The first rush would put us in a "dirty fix" mode and reject whatever takes time. We want to avoid *automatically generated config* as much as possible.

  * **no extra dependency**: of course, using Python means that Python has to be installed on every managed system. Same for nodejs, PHP, java, anything. Instead, the tool is what will manage such installations. So we need to rely to the basic common platform tools available: GNU/Linux with bash and coreutils.


## The standard

* on the filesystem, separate clearly between:
  * distribution files: those which get upgraded with the distribution
  * local system files: system-specific files which only change upon sysadmin op
  * shared systel files: same, but for cross-system shared files
  * other files we don't care about fow now: application variable data, multi-instance files, temporary files

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
