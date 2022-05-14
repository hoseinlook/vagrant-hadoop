#!/usr/bin/env bash


export  JAVA_HOME=/usr/lib/jvm/default-java
export  HADOOP_HOME=/opt/hadoop

# start worker services
sudo -u hadoop /opt/hadoop/bin/yarn --daemon start nodemanager
sudo -u hadoop /opt/hadoop/bin/hdfs --daemon start datanode