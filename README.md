

# Introduction
vagrant is a useful tool for managing vm's

this project is a simple hadoop setup with vagrant 

# Install
At first [install vagrant](https://www.vagrantup.com/downloads)

# How to run
just run this command

```bash
vagrant up
```
### Note:
for Apple Silicon run this commands

[docker_branch](https://github.com/hoseinlook/vagrant-hadoop/tree/docker_provider) use docker as a provider instead of virtualbox
```bash
git checkout docker_provider
vagrant up
```

## WebUI
+ http://10.20.30.11:9870  #hdfs webUI
+ http://10.20.30.11:8088  #yarn webUI

### Note:
if you are using docker your webUI address will be changed because in docker version project use port_forwarding 
+ http://localhost:9870  #hdfs webUI
+ http://localhost:8088  #yarn webUI

### Useful commands:
+ delete vm's with their files
    ```bash 
    vagrant destroy
    ```
+ shutdown vm's
    ```bash 
    vagrant halt
    ```

+ ssh to a specific vm
    ```bash 
    vagrant ssh <YOUR-VM-NAME>
    ```

# Optional
run this command to set hosts
```bash
sudo sed -i '/hadoop/d' /etc/hosts
echo "
10.20.30.11 hadoop-master
10.20.30.21 hadoop-worker1
10.20.30.22 hadoop-worker2
10.20.30.23 hadoop-worker3
" | sudo tee -a /etc/hosts
```

# References
+ [hadoop](https://hadoop.apache.org/docs/stable/)
+ [hadoop-core-configs](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/core-default.xml)
+ [hadoop-hdfs-configs](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/hdfs-default.xml)
+ [hadoop-yarn-configs](https://hadoop.apache.org/docs/stable/hadoop-yarn/hadoop-yarn-common/yarn-default.xml)