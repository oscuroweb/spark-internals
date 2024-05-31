#!/usr/bin/env bash


docker stop zeppelin
docker rm zeppelin

if command -v docker-compose &> /dev/null
then
    docker-compose build
    docker-compose up -d
else
    docker build -t zeppelin .
    docker run -d \
        --platform=linux/x86_64 \
        -p 8888:8080 \
        -p 4040:4040 \
        -v $(pwd)/notebook/:/opt/zeppelin/notebook/SparkInternals \
        -v $(pwd)/data:/data \
        -e ZEPPELIN_NOTEBOOK_DIR=/opt/zeppelin/notebook/SparkInternals \
        -e SPARK_PUBLIC_DNS=localhost \
        --name zeppelin \
        zeppelin
fi
