#!/usr/bin/env bash

HADOOP_VERSION=3.3.2

sudo apt-get update -y
sudo apt install nano
## Install java
# sudo apt-get update -y
sudo apt-get install -y default-jre
# Install below jdk to be able to use jps command
sudo apt install openjdk-8-jdk-headless

## Add hadoop user
sudo adduser --system --home /home/hadoop --shell /bin/bash --group --disabled-login hadoop


## Download and extract hadoop just if not exists
if [ ! -d /vagrant/share_files/cache/hadoop-${HADOOP_VERSION}/ ]; then
    wget -P /vagrant/share_files/cache/ https://downloads.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz
    tar -xzvf /vagrant/share_files/cache/hadoop-${HADOOP_VERSION}.tar.gz -C /vagrant/share_files/cache/
fi

## Copy hadoop directory to opt
sudo cp -R /vagrant/share_files/cache/hadoop-${HADOOP_VERSION} /opt/hadoop
sudo chown hadoop:hadoop -R /opt/hadoop/

# set path's of hadoop
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/hadoop/bin
echo  'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/hadoop/bin"' |sudo tee /etc/environment
echo  "JAVA_HOME=/usr/lib/jvm/default-java" |sudo tee -a /etc/environment
echo  "HADOOP_HOME=/opt/hadoop" |sudo tee -a /etc/environment
source /etc/environment
sudo sed -i -E "s@Defaults\s*secure_path=.*@Defaults secure_path=${PATH}@"  /etc/sudoers


## Create hadoop directories
sudo mkdir /var/{lib,log}/hadoop
sudo chown hadoop:hadoop -R /var/{lib,log}/hadoop

## Edit hosts
sudo sed -i '/hadoop/d' /etc/hosts
echo "
10.20.30.11 hadoop-master
10.20.30.21 hadoop-worker1
10.20.30.22 hadoop-worker2
" | sudo tee -a /etc/hosts

## Copy configs
sudo cp /vagrant/share_files/configs/{core,hdfs,mapred,yarn}-site.xml /opt/hadoop/etc/hadoop/

## Config hadoop-env
sudo -u hadoop sed -i -E 's/#? *export JAVA_HOME=.*/export JAVA_HOME=\/usr\/lib\/jvm\/default-java/' /opt/hadoop/etc/hadoop/hadoop-env.sh
sudo -u hadoop sed -i -E 's/#? *export HADOOP_LOG_DIR=.*/export HADOOP_LOG_DIR=\/var\/log\/hadoop/' /opt/hadoop/etc/hadoop/hadoop-env.sh
sudo -u hadoop sed -i -E 's/#? *export HDFS_NAMENODE_USER=.*/export HDFS_NAMENODE_USER=hadoop/' /opt/hadoop/etc/hadoop/hadoop-env.sh
echo "#################### Others ####################" | sudo -a  tee /opt/hadoop/etc/hadoop/hadoop-env.sh
echo "export HDFS_DATANODE_USER=hadoop" | sudo tee -a  /opt/hadoop/etc/hadoop/hadoop-env.sh
echo "export HDFS_SECONDARYNAMENODE_USER=hadoop" | sudo tee -a  /opt/hadoop/etc/hadoop/hadoop-env.sh
echo "export YARN_RESOURCEMANAGER_USER=hadoop" | sudo tee -a  /opt/hadoop/etc/hadoop/hadoop-env.sh
echo "export YARN_NODEMANAGER_USER=hadoop" | sudo tee -a /opt/hadoop/etc/hadoop/hadoop-env.sh

## Config workers
echo "" | sudo tee /opt/hadoop/etc/hadoop/workers


