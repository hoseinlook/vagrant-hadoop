#!/usr/bin/env bash

export  JAVA_HOME=/usr/lib/jvm/default-java
export  HADOOP_HOME=/opt/hadoop

## Format namenode
sudo -u hadoop /opt/hadoop/bin/hdfs namenode -format 2> /dev/null

## start master services
sudo -u hadoop /opt/hadoop/bin/yarn --daemon start resourcemanager
sudo -u hadoop /opt/hadoop/bin/hdfs --daemon start namenode

