# Gitted, for GIT-backed LXC containers

Gitted solves 2 problems:

* website software *installation* (for example, a CMS like Drupal) can
  be complex to install and configure, because of the dependencies
  that are needed on the system ;

* website *state* (for example, MySQL data) is difficult to manage:
  doing simple database dumps are often not enough, if it needs file
  uploads, applicative plugins, etc.

## Machine and state out of GIT data

To address these issues, Gitted help you manage the website
software *and* the changing data as one unique thing, which is stored
as a GIT repository.

Gitted provides a special ```ext::``` GIT remote that let you do:
* ```git push``` to build, configure and run the LXC container in one
  go
* ```git pull``` to retrieve whatever state has been modified, for
  example MySQL data: everything is exported as flat files and
  versionned using Git.
* ```git push``` again, to update the LXC container with changes that
  have been made locally on the files, or pulled from any source

The [gitted-client](tree/usr/bin/gitted-client) is registered as an
```ext::``` GIT remote handler that creates the LXC container using
lxc-create(1) and the ```download``` template to setup a Debian Wheezy
system.

Then it copies the ```gitted/sysconf``` directory into the container
and run ```sysconf``` to setup the environement (dependent packages,
```/etc``` config, custom fixes and installs...).

At this point, the LXC container is fully configured and running, with
empty data.

But, the ```gitted/sysconf/``` directories defines rules for importing
git-versionned data files as living state. For example,
```myssql/*.dump.sql``` files should be imported in the running MySQL
database. These importations are runned by scripts specified in
```/etc/gitted/sync/*.import``` called after any
```git-receive-pack``` by the [gitted server](tree/usr/bin/gitted).


## Machine and state exported as GIT state




# GITTED

## Manage the life of an LXC container through git push/fetch

Here is the philosophy: a GIT repository represents a program or a
content.

* a program is meant to be run: for that it needs an given system
environment.

* a content is meant to be visualized, manipulated or edited: for that
it needs programs, which need more or less complex environments.

What GITTED (git-lxc) brings is:
* you clone a GIT repository with GITTED-enabled data
* you run: ``` gitted/gitted-client init mycontainer ```
* you push the data to it: ``` git push mycontainer master ```
* read the messages, it shows a URL like http://10.0.3.254/ that you
  may open in your browser to visualize or edit the data

What happens is:
* _gitted-client init_ copies itself into the _.git/_ directory and
  register (itself) as a GIT remote named _mycontainer_ using the
  _ext::_ protocol
* _git push_ pushes the data to _gitted-client_ which:
    * creates the LXC container _mycontainer_ with _lxc-create(1)_
    * start the container with _lxc-start(1)_
    * initialize the container (through sysconf)
    * run [/usr/bin/gitted](tree/usr/bin/gitted) _git-remote-command_
      inside the container, which does the rest:
        * export some machine state through into GIT commits
        * execute the requested git remote command (_git-receive-pack_
          or _git-upload-pack_)
        * import things from the pushed new GIT commits


Import/export is about:
* MongoDB data:
  [PUSH](tree/usr/share/gitted/import/mongodb) and
  [PULL](tree/usr/share/gitted/export/mongodb) support
* PostgreSQL data:
  [PUSH](tree/usr/share/gitted/import/mongodb) support
* MySQL data
* Application data
* ... anything a handler is defined as a script in
_/usr/share/gitted/import/_ and/or _/usr/share/gitted/export/_.


### push-to-deploy, but also pull-to-backup

After the above commands, you may interact with the container (HTTP
application, databases...), then:
* make a ``` git pull mycontainer master ``` to fetch the new state
  with modifications

Up-to-date data from PostgreSQL, MySQL, etc., is automagically saved
back to GIT files with commits, before being pulled as normal.

The different kinds of exports depend on scripts in
_/usr/share/gitted/export/_. It is quite easy to write new ones
(application data, for example) as GITTED provides like a framework for
it. The magic is about the easiness and interoperability to handle the
whole thing, compared to the complexity.


### Various scenarios

#### The LXC container is like an editor for the GIT repository
#### The GIT repository is a backup for the container


