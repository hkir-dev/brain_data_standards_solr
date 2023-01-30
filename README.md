# Brain Data Standards Solr
A repository for the Brain Data Standards Solr instance

## Build and Run
To build the project, clone the project to your computer and run the following commands in the project root folder:
```
docker build -t bds/solr-prod .
```

To run the built Docker image:
```
mkdir solr_data
sudo chown 8983:8983 solr_data  # necessary on Linux, not Mac.
docker run -d -v "$PWD/solr_data:/var/solr" -p 8983:8983 --name bds_solr bds/solr-prod
```
Now you should be able to see [Solr home page](http://localhost:8983/solr) and the [created core](http://localhost:8983/solr/#/~cores/bdsdump).

To index the bds data:
```
docker exec -it bds_solr post -c bdsdump /opt/bds_data/index.json
```

Now you should see indexed data when you browse the [query interface](http://localhost:8983/solr/#/bdsdump/query) and click the 'Execute Query' button.
