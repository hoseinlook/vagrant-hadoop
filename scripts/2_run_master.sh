#!/usr/bin/env bash



## Format namenode
sudo -u hadoop hdfs namenode -format 2>/dev/null

## start master services
sudo -u hadoop yarn --daemon start resourcemanager
sudo -u hadoop hdfs --daemon start namenode
