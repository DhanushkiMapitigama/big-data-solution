FROM ubuntu:22.04

ARG scala_version="2.12.10"
ARG build_date
ARG shared_workspace=/opt/workspace

ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir -p ${shared_workspace}/data
RUN mkdir -p /usr/share/man/man1
RUN apt-get update -y
RUN apt-get install -y wget r-base
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt install python3.7 -y
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN apt install -y openjdk-8-jre-headless
RUN apt install -y scala

ENV SCALA_HOME="/usr/bin/scala"
ENV PATH=${PATH}:${SCALA_HOME}/bin
ENV SHARED_WORKSPACE=${shared_workspace}

VOLUME ${shared_workspace}
CMD ["bash"]

ARG spark_version="3.3.2"
ARG hadoop_version="3"
ARG build_date

COPY spark-3.3.2-bin-hadoop3/ /usr/bin/spark-3.3.2-bin-hadoop3
    
RUN echo "alias pyspark=/usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/bin/pyspark" >> ~/.bashrc && \
    echo "alias spark-shell=/usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/bin/spark-shell" >> ~/.bashrc && \
    mkdir /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/logs 

ENV SPARK_HOME /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}
ENV SPARK_MASTER_HOST spark-master
ENV SPARK_MASTER_PORT 7077
ENV PYSPARK_PYTHON python3

WORKDIR ${SPARK_HOME}
