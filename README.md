# Gitted, for GIT-backed LXC containers

Gitted solves 2 problems:

* website software *installation* (for example, a CMS like Drupal) can
  be complex to install and configure, because of the dependencies
  that are needed on the system ;

* website *state* (for example, MySQL data) is difficult to manage:
  doing simple database dumps are often not enough, if it needs file
  uploads, applicative plugins, etc.

To address these issues, Gitted help you manage the website
software *and* the changing data as one unique thing, which is stored
as a GIT repository.

### Usage instructions

* See: [How to use a Gitted-powered GIT repository](README.USE.md)
* See: [How to setup Gitted for an application](README.NEW.md)

## push-to-deplay: Machine and state out of GIT data

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
  [PUSH](tree/usr/share/gitted/import/postgresql) support
* MySQL data (not implemented yet)
* Application data
* ... anything a handler is defined as a script in
_/usr/share/gitted/import/_ and/or _/usr/share/gitted/export/_.


### pull-to-backup: Machine and state exported as GIT state

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
