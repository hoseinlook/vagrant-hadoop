#!/usr/bin/env bash

sudo su hadoop

## Format namenode
hdfs namenode -format 2>/dev/null

## start master services
yarn --daemon start resourcemanager
hdfs --daemon start namenode
