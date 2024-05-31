# Apache Spark - Internals

## Table of Contents
1. [Introduction](#introduction)
2. [Architecture](#architecture)
3. [Components](#components)
4. [Key Features of Apache Spark](#key-features-of-apache-spark)
5. [Examples](#examples)
6. [Dataset](#dataset)
7. [References](#references)

## Introduction

Apache Spark is an open-source, distributed computing system designed for fast big data processing. It offers a comprehensive framework capable of handling a wide range of data processing tasks, including batch processing, interactive queries, real-time streaming, machine learning, and graph processing. Spark extends the MapReduce model to efficiently use more types of computations, such as interactive queries and stream processing, and introduces an in-memory cluster computing capability, which boosts the speed of the applications that require repetitive operations on the same datasets.

### When is Apache Spark useful?
1.	Big Data Processing: Spark excels in environments where large volumes of data need to be processed efficiently. Its distributed computing model allows it to scale out linearly with the addition of more nodes.
2.	Real-Time Data Processing: Apache Spark Streaming can process real-time data with high throughput and low latency, making it ideal for use cases like real-time analytics, fraud detection, and monitoring.
3.	Machine Learning: Spark includes a scalable machine learning library called MLlib. It simplifies the development of scalable machine learning algorithms, handling large datasets much faster than on single machines.
4.	Iterative Algorithms: Spark's in-memory processing capability makes it highly suitable for iterative algorithms which involve multiple passes over the same data, such as clustering and logistic regression.
5.	Interactive Data Analysis: Tools like Spark SQL allow for interactive querying and analysis of big data, which is a common requirement in data analytics and business intelligence applications.
### Examples Where Apache Spark is Not the Best Option
1.	Small-Scale Data Processing:
- Scenario: Companies dealing with moderate amounts of data where the overhead of setting up a distributed computing cluster may outweigh its benefits. 
- Alternative: Traditional tools and frameworks like traditionals databases or Python's Pandas.
2.	Low-Latency, Small-Batch Jobs:
- Scenario: Tasks that require sub-millisecond latencies and operate on small batches (e.g., microservices handling a few data points at a time).
- Alternative: Dedicated microservice frameworks.
3.	Non-Distributed Workloads:
- Scenario: Workloads that don't benefit from distribution because they fit comfortably within the resources of a single machine.
- Alternative: Using standalone applications or libraries designed for single-machine operations, such as Scikit-Learn for machine learning.
4.	Highly Specialized Data Processing:
- Scenario: Use cases that require very specific processing capabilities not natively supported by Spark, such as certain types of geospatial or biological data analysis.
- Alternative: Specialized tools tailored to these domains, like GDAL for geospatial data or Bioconductor for biological data analysis.
In summary, while Apache Spark is a powerful tool for big data processing, real-time analytics, and machine learning on large datasets, it might not be the best fit for small-scale, low-latency, non-distributed, or highly specialized tasks.

## Architecture

Specifically, to run on a cluster, the SparkContext can connect to several types of cluster managers (either Spark’s own standalone cluster manager, Mesos, YARN or Kubernetes), which allocate resources across applications. Once connected, Spark acquires executors on nodes in the cluster, which are processes that run computations and store data for your application. Next, it sends your application code (defined by JAR or Python files passed to SparkContext) to the executors. Finally, SparkContext sends tasks to the executors to run.
![Spark Architecture](https://spark.apache.org/docs/latest/img/cluster-overview.png)

## Components

Spark has several key components that work together to provide a powerful and flexible distributed computing platform. These components include:

1. Spark Core: The core engine of Spark that provides the basic functionality for distributed computing, including task scheduling, memory management, and fault recovery.
2. Spark SQL: A module for working with structured data using SQL and DataFrame APIs.
3. Spark Streaming: A module for processing real-time streaming data.
4. MLlib: A machine learning library for building and training machine learning models.
5. GraphX: A library for working with graph data and performing graph computations.

![Spark Components](https://www.oreilly.com/api/v2/epubs/9781492050032/files/assets/lesp_0103.png)

## Key Features of Apache Spark

Apache Spark offers a wide range of features that make it a powerful tool for big data processing and analytics:

1. In-Memory Computing:
    - Spark is designed for in-memory processing, which significantly boosts the speed of data processing tasks, particularly those that involve multiple iterations over the same dataset, such as machine learning algorithms.

2. Transformations, Actions, and Lazy Processing:
    - **Transformations:** Operations that create a new dataset from an existing one. They're lazy, meaning Spark builds up a lineage of transformations to apply when an action is called. Examples include `map()`, `filter()`, and `reduceByKey()`.
    - **Actions:** Operations that trigger the execution of the transformations to return a result to the driver program or write data to storage. Examples include `collect()`, `count()`, and `saveAsTextFile()`.
    - **Lazy Processing:** Spark uses lazy evaluation for transformations, delaying their execution until an action is called. This approach results in optimized execution plans, represented as a Directed Acyclic Graph (DAG), minimizing data shuffling and optimizing resource usage.

3. Rich API, Integrations, and Resource Management:
    - **Rich API:** Provides high-level APIs for Java, Scala, Python, and R, making it accessible to a wide range of developers. Its concise and expressive APIs allow for easy data manipulation and transformation.
    - **Integrations and Ecosystem:** Spark seamlessly integrates with Hadoop and other big data tools, such as HDFS, HBase, and Cassandra. It supports various data formats and can be deployed in diverse environments, from standalone clusters to cloud services.
    - **Resource Management:** Can be deployed using various resource managers, including Hadoop YARN, Apache Mesos, and Kubernetes, efficiently handling cluster resources.

4. Fault Tolerance:
    - Spark ensures fault tolerance through lineage information. If a partition of data is lost, Spark can recompute it using the transformations recorded in the lineage.

By leveraging these key features, Apache Spark provides a robust and flexible platform for handling diverse big data processing and analytics workloads efficiently.

## Examples
1. [Trnasform form CSV to Parquet](./notebook/00_transform_from_csv_to_parquet_2JZUJZRPQ.zpln)
2. [Transformation vs. Actions](./notebook/01_transformation_vs_actions_202405301.zpln)
3. [Joins](./notebook/02_joins_202405302.zpln)
4. [Repartition vs. Coalesce](./notebook/03_repartition_vs_coalesce_202405303.zpln)

## Dataset
Dataset used in these examples haven been obtained from [Malaga City Hall Open Data Portal](https://datosabiertos.malaga.eu/). 
- [Inhabitants 2017](https://datosabiertos.malaga.eu/recursos/demografia/padron/2017/padronbarrios.csv)
- [Inhabitants 2018](https://datosabiertos.malaga.eu/recursos/demografia/padron/2018/padronbarrios.csv)
- [Inhabitants 2019](https://datosabiertos.malaga.eu/recursos/demografia/padron/2019/padronbarrios.csv)
- [Inhabitants 2020](https://datosabiertos.malaga.eu/recursos/demografia/padron/2020/padronbarrios.csv)
- [Inhabitants 2021](https://datosabiertos.malaga.eu/recursos/demografia/padron/2021/padronbarrios.csv)
- [Neighborhood](https://datosabiertos.malaga.eu/recursos/urbanismoEInfraestructura/planimetria/callejero/da_cartografiaBarrio-25830.csv)
- [Municipality](https://datosabiertos.malaga.eu/recursos/demografia/padron/tablas-catalogo/municipio.csv)
- [Province](https://datosabiertos.malaga.eu/recursos/demografia/padron/tablas-catalogo/provincia.csv)
- [Country](https://datosabiertos.malaga.eu/recursos/demografia/padron/tablas-catalogo/pais.csv)

## References
- [Apache Spark](https://spark.apache.org/)
- [Learning Spark](https://www.oreilly.com/library/view/learning-spark-2nd/9781492050032/ch01.html)
- Spark: The Definitive Guide by Bill Chambers and Matei Zaharia