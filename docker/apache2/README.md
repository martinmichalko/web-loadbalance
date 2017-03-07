### start the apache server

docker run --network host -d --name apache -v /data/projects/ansible2-2/pb/mariadb/docker/apache2/dir-data/:/var/www/html/:rw apache
