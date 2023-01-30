FROM solr:8.5.2

ENV solr.allowPaths='*'

USER root

# Download latest bds index
ARG LATEST_DATA=https://raw.githubusercontent.com/obophenotype/brain_data_standards_queries/main/dumps/individuals_metadata_solr_20220302.json
ENV WORKSPACE=/opt/bds_data
RUN mkdir $WORKSPACE
RUN wget $LATEST_DATA -O $WORKSPACE/index.json

USER solr

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["solr-precreate", "bdsdump"]
