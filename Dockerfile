FROM gettyimages/spark

MAINTAINER wassim

ARG POSTGRES_DRIVER=https://jdbc.postgresql.org/download/postgresql-42.2.2.jar
ARG CASSANDRA_CONNECTOR=http://central.maven.org/maven2/com/datastax/spark/spark-cassandra-connector_2.11/2.3.0/spark-cassandra-connector_2.11-2.3.0.jar
RUN curl -sL --retry 3 \
  --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
  -o ${SPARK_HOME}/jars \
  ${POSTGRES_DRIVER}
 
RUN curl -sL --retry 3 \
  --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
  -o ${SPARK_HOME}/jars \
  ${CASSANDRA_CONNECTOR}

