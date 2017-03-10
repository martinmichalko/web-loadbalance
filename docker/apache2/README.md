### start the apache server for testing

docker run --network host --rm --name apache2 -v /dir-data/apache2:/dir-data:rw localhost:5000/apache2
