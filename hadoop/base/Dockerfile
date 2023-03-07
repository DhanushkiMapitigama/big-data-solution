FROM ubuntu:22.04

#Moving in PySpark/Hadoop test to the container(Write/Reading dataframe)
COPY test.py /

RUN apt-get update && apt-get install -y --no-install-recommends \
      openjdk-8-jdk \
      net-tools \
      netcat \
      libsnappy-dev \
      nano \
      wget \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y make build-essential libssl-dev zlib1g-dev \
       libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
       libncurses5-dev libncursesw5-dev xz-utils tk-dev
RUN wget https://www.python.org/ftp/python/3.8.4/Python-3.8.4.tgz
RUN tar xzf Python-3.8.4.tgz
RUN cd Python-3.8.4 && ./configure --enable-optimizations && make -j 8 && make altinstall

RUN apt-get install -y python3-pip
RUN pip3 install --no-cache-dir --upgrade pyspark
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/


ENV HADOOP_VERSION 3.3.4
COPY ../hadoop-3.3.4/ /usr/local/hadoop-3.3.4
RUN mkdir /usr/local/hadoop-$HADOOP_VERSION/logs
RUN mkdir /hadoop-data

ENV HADOOP_HOME=/usr/local/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH $HADOOP_HOME/bin/:$PATH

ADD entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
