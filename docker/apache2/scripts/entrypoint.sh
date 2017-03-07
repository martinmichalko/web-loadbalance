#!/bin/bash
set -e
set -x

initfile="/app/first-run-done";
# check if this is first container run
if [ ! -f "${initfile}" ]; then
    echo "first start running";

    #if there is external CONFIG file provided in dir-config
    if [ -d /dir-config/conf ]; then
        echo "external config provided - link will be created";
        rm -r /etc/httpd;
        ln -s /dir-config /etc/httpd;
    else
        echo "internal config will be moved to /dir-config"
        cp -r /etc/httpd/* /dir-config;
        rm -r /etc/httpd;
        ln -s /dir-config /etc/httpd;
    fi;

    #if there is external DATA file provided in dir-config
    #whole data directory  /var/www/html/
    #if the directory dir-data is not empty than
    if [ ! -z "$(ls -A /dir-data)" ]; then
      echo "external data provided - link will be created";
      rm -r /var/www/html;
      ln -s /dir-data /var/www/html;

    touch ${initfile};
    echo "first start finished";
    fi;
fi;

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
rm -rf /run/httpd/* /tmp/httpd*

exec "$@"
