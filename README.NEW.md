# How to setup Gitted for an application

This page explains how to turn a web application into a Gitted-enabled
GIT repository.

* See: [README.md](README.md)


## Initialize a GIT repository with the minimal Gitted sysconf

```
git init my-app
cd my-app
```

Before going further, you need to make the *master* branch exist by
creating a commit:
```
touch README.md
git add README.md
git commit -m "initial commit"
```

Then import the
[sysconf.gitted profile](https://github.com/geonef/sysconf.gitted) and
its dependency [sysconf.base](https://github.com/geonef/sysconf.base):

```
git subtree add -P gitted/sysconf/sysconf.gitted git@github.com:geonef/sysconf.gitted.git
git subtree add -P gitted/sysconf/sysconf.base git@github.com:geonef/sysconf.base.git
```

Make the symlink to ease the usage of gitted:
```
ln -s sysconf/sysconf.gitted/tree/usr/bin/gitted-client gitted/gitted-client
```

Done!


## Try the minimal system

```
gitted/gitted-client register
gitted/gitted-client add vm-atlas-base
git push vm-atlas-base master
```

The construction of the LXC container happens during the ```git
push``` operation.

You may check that the system is fine and running by listing:
```
lxc-ls -f
```

You may want to start an interactive shell:
```
lxc-attach -n vm-atlas-base /bin/bash
```

Everything is okay? Then destroy the container for now:
```
lxc-destroy -f -n vm-atlas-base
```

## Make your custom sysconf profile

## 
