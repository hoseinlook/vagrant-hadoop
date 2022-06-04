#!/usr/bin/env bash

# start worker services
sudo -u hadoop yarn --daemon start nodemanager
sudo -u hadoop hdfs --daemon start datanode
