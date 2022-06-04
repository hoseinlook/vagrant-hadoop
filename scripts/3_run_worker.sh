#!/usr/bin/env bash

sudo su hadoop
# start worker services
yarn --daemon start nodemanager
hdfs --daemon start datanode
