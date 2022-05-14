

# vagrant
vagrant is a useful tool for managing vm's

this project is a simple hadoop setup with vagrant 



# how to run
just run this command

```bash
vagrant up
```
### note:
for Apple Silicon run this commands

[docker_branch]() use docker as a provider instead of virtualbox
```bash
git checkout docker_provider
vagrant up
```

## webUI
+ http://10.20.30.11:9870  #hdfs webUI
+ http://10.20.30.11:8088  #yarn webUI


### useful commands:
+ delete vm's with their files
    ```bash 
    vagrant destroy
    ```
+ shutdown vm's
    ```bash 
    vagrant halt
    ```
  
# references
+ [hadoop](https://hadoop.apache.org/docs/stable/)
+ [hadoop-core-configs](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/core-default.xml)
+ [hadoop-hdfs-configs](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/hdfs-default.xml)
+ [hadoop-yarn-configs](https://hadoop.apache.org/docs/stable/hadoop-yarn/hadoop-yarn-common/yarn-default.xml)
