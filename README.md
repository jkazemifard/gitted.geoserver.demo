# GeoServer gitted demo

[GeoServer](http://geoserver.org/) is an open source software server
written in Java that allows users to share and edit geospatial
data. Designed for interoperability, it publishes data from any major
spatial data source using open standards.

See also:
[GeoServer GitHub repository](https://github.com/geoserver/geoserver).


The [```sysconf/```](sysconf/) directory contains the Sysconf
  definitions (see the
  [official Sysconf repository](https://github.com/geonef/sysconf.base/))
  to build the
  [Gitted](https://github.com/geonef/sysconf.gitted)-enabled system
  with GeoServer, its dependencies and the settings to import/export
  the GeoServer data as Git files.


## Get started

**You don't need to be root!** but you need [Git](http://git-scm.com/)
and [LXC](https://linuxcontainers.org/) installed on your Linux
system. See [Gitted](https://github.com/geonef/sysconf.gitted) for
more information.

```
git clone https://github.com/jfgigand/gitted.geoserver.demo.git
cd gitted.geoserver.demo
sysconf/gitted-client register
sysconf/gitted-client add geoserver-demo
git push geoserver-demo master
```

The last command creates the LXC container ```geoserver-demo```,
install GeoServer and the required packages (from ```sysconf/```) and
import the data.

* Open the URL ```<IP>:8080/geoserver``` on your browser (get the
  container IP from the ```git push``` messages or with ```lxc-ls
  -f``` .

* Log as : *admin* / *geoserver*



### Export / backup changes

From the repository directory you have cloned:
```
git pull geoserver-demo master
```

It's as simple as that. Now you can make a ```git push origin
master``` to propagate the changes to the upstream remote, or any
other remote, as usual with Git.
