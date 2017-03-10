FROM centos:7
MAINTAINER Martin Michalko (matemichal@gmail.com)

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum clean all

### external volumes
#whole config directory:
#VOLUME  /etc/apache2/ in CentOS /etc/httpd/
VOLUME /dir-config

#whole data directory:
#VOLUME /var/www/html/
VOLUME /dir-data

## copy startup scripts and configuration files
COPY scripts /app/
COPY configs /app/configs
COPY dir-data /app/data

# Define workdir
WORKDIR /app
RUN chmod u+x /app/*

EXPOSED 80

ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["/usr/sbin/apachectl", "-DFOREGROUND"]
