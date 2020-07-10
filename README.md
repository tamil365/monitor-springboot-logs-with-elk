# Monitor Sprint boot applications with ELK
- Run ELK in docker
- Run Springboot Application in another docker
- Configure filebeat plugin to writes logs to Elastic Server
# Code
    git clone https://github.com/balajich/monitor-springboot-logs-with-elk.git
# Video
# Architecture
# Bootstrap environment
We will be using vagrant to bring two systems up
- elkserver (Linux machine that runs elk)
- sbclient (Linux machine that runs  Springboot application and filebeat client) 

    Bring two vms up ,installs docker-compose and setup network
    vagrant up
# Running ELK in docker container

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

# Installing filebeat plugin on client
# Running Springboot application

