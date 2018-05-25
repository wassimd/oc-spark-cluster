FROM gettyimages/spark

MAINTAINER wassim

COPY dep/postgresql-42.2.2.jar  $SPARK_HOME/jars/
COPY dep/spark-cassandra-connector_2.11-2.3.0.jar $SPARK_HOME/jars/

