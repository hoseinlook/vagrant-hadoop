#!/usr/bin/env bash

export  JAVA_HOME=/usr/lib/jvm/default-java
export  HADOOP_HOME=/opt/hadoop


## Edit hosts
echo "
127.0.0.1 localhost
0.0.0.0 hadoop-master
10.20.30.21 hadoop-worker1
10.20.30.22 hadoop-worker2
" | sudo tee  /etc/hosts

## Format namenode
sudo -u hadoop /opt/hadoop/bin/hdfs namenode -format 2> /dev/null

## start master services
sudo -u hadoop /opt/hadoop/bin/yarn --daemon start resourcemanager
sudo -u hadoop /opt/hadoop/bin/hdfs --daemon start namenode

