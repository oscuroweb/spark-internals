FROM apache/zeppelin:0.10.1

USER root

ENV SPARK_VERSION=3.2.1
ENV HADOOP_VERSION=3.2

# Install Apache Spark and Hadoop
RUN curl -L https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -o /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
RUN tar -xvzf /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C /opt/
RUN mv /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /opt/spark
RUN rm /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

# Set environment variables
COPY conf/zeppelin-env.sh /opt/zeppelin/conf/zeppelin-env.sh
RUN chmod +x /opt/zeppelin/conf/zeppelin-env.sh

