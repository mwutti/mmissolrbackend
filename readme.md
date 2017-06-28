# Installation
1. Donwload and install docker https://docs.docker.com/
2. Run pre-configured solr docker container

   $ docker run --name <solr_name> -d -p 8983:8983 -t solr
3. Create and run a docker core for the application

   $ docker exec -it --user=solr <solr_name> bin/solr create_core -c <core_name>

4. You should now see the solr admin page at http://localhost:8983
5. Import Project as a Maven Project
5. Adjust the field solr_host located at src/main/resources/application.properties if necessary
6. Run the application 

   $ mvn springboot:run  

7. Index some test data into solr core

   http://localhost:8080/deletalldataincoreandindexfromfile