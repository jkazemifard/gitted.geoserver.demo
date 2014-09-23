# Sysconf profile gitted.geoserver/actual -- Installer script  -*- shell-script -*-

. /usr/lib/sysconf.base/common.sh


################################################################################
# Install required Debian packages
#
_packages=
_packages="$_packages tomcat7 unzip"
_packages="$_packages postgresql-9.1 postgresql-9.1-postgis"
sysconf_require_packages $_packages


local _pg_config=/etc/postgresql/9.1/main/postgresql.conf
if [ -f $_pg_config ]; then
    rm -f $_pg_config
    echo "Setting symlink for: $_pg_config"
    ln -s ../../../postgresql-common/postgresql.conf $_pg_config
    service postgresql restart
fi

################################################################################
# Install GeoServer WAR file on tomcat

war_dest_dir=/var/lib/tomcat7/webapps
war_file=geoserver.war
geoserver_war_zip_url=http://freefr.dl.sourceforge.net/project/geoserver/GeoServer/2.5.2/geoserver-2.5.2-war.zip

if [ ! -f $war_dest_dir/$war_file ]; then
    tmp_dir=$(mktemp -d)
    zip_file=$(mktemp)

    nef_log "Downloading: $geoserver_war_zip_url"
    curl $geoserver_war_zip_url >$zip_file || nef_fatal "could not download geoserver"
    cd $tmp_dir
    unzip $zip_file || nef_fatal "could not unzip GeoServer archive"
    mv $war_file $war_dest_dir || nef_fatal "could not install geoserver.war into: $war_dest_dir"
    rm -rf $tmp_dir $zip_file
    # tomcat7 listen on IPv6 ::0 only, we have to change to IPv4 0.0.0.0
    sed -ri 's/(Connector) (port=)/\1 address="0.0.0.0" \2/g' /etc/tomcat7/server.xml
    nef_log "Done installing $war_dest_dir/$war_file"
    service tomcat7 restart
fi
