# oc-spark-cluster
Launch a spark cluster on the latest spark version **with 2 or more nodes**. 
It is based on https://github.com/gettyimages/docker-spark project 

## spark
A debian:jessie based Spark container. Use it in a standalone cluster with the accompanying docker-compose.yml, or as a base for more complex recipes.

## docker example
To run SparkPi, run the image with Docker:
```
docker run --rm -it -p 4040:4040 wassim/oc-spark-cluster bin/run-example SparkPi 10
```

To start spark-shell with your AWS credentials:
```
docker run --rm -it -e "AWS_ACCESS_KEY_ID=YOURKEY" -e "AWS_SECRET_ACCESS_KEY=YOURSECRET" -p 4040:4040 wassim/oc-spark-cluster bin/spark-shell
```

To do a thing with Pyspark
```
echo "import pyspark\nprint(pyspark.SparkContext().parallelize(range(0, 10)).count())" > count.py
docker run --rm -it -p 4040:4040 -v $(pwd)/count.py:/count.py wassim/oc-spark-cluster bin/spark-submit /count.py
```

## docker-compose example
To create a simplistic standalone cluster with docker-compose:

```
docker-compose up
```

The SparkUI will be running at `http://${YOUR_DOCKER_HOST}:8082` with one worker listed. To run pyspark, exec into a container:

```
docker exec -it dockerspark_master_1 /bin/bash
bin/pyspark
```

To run SparkPi, exec into a container:

```
docker exec -it dockerspark_master_1 /bin/bash
bin/run-example SparkPi 10
```

### Scale In/Out
To add more workers or remove workers you can use the scale command of docker-compose : 
```
docker-compose scale worker=2
```

### Access the worker or master nodes

```
docker exec -ti sparkclusterdocker_master_1 bash
docker exec -ti sparkclusterdocker_worker_1 bash
```
