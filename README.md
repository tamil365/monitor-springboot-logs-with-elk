# Monitor Springboot Java application logs with ELK
Using ELK we are going to monitor logs of Java application. In this tutorial we are using Springboot expose rest api and its logs are written to filesystem. 

Filebeat reads the logs from filesystem and places them in Elastic Search Index.

We will
- Run ELK in docker container
- Run Java application that produces log messages
- Configure filebeat plugin to read log messages and write them to Elastic Server
- Use Kibana to view or query the logs
# Code
    git clone https://github.com/balajich/monitor-springboot-logs-with-elk.git
# Prerequisite
- Docker Compose
- Vagrant (optional)
- Java
# Video
# Architecture
# Bootstrap environment
We will be using vagrant to bring two machines up
- elkserver (Linux machine that runs elk)
- sbclient (Linux machine that runs  Springboot java application and filebeat client) 

## Bring two virtual machines up ,installs docker-compose and setup network    
        
        vagrant up
The virutal machine configuration, network and necessary installation is defined in Vagrantfile
## Server- ELK in docker container

Take ssh to elkserver
Increase vm.max_map_count 
### On Windows
    open powershell
    wsl -d docker-desktop
    sysctl -w vm.max_map_count=262144

## On Linux
    sudo sysctl -w vm.max_map_count=262144
    sysctl -a | grep max_map_count
## Start ELK on Docker
    # Run elk in detached mode in docker
    docker-compose up -d

# Client- Springboot application and filebeat plugin

- Spring boot application writes logs to folder

# Running Springboot application

# References
- https://github.com/spring-guides/gs-rest-service
