#!/bin/bash

#########################################

#docker镜像名称
DOCKER_IMAGE_NAME='helloworld:v1'
#docker容器名称
DOCKER_CONTAINER_NAME='helloworld'
#运行参数
JAVA_OPTS='-Xms1.5g -Xmx1.5g -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyF    raction=75 -XX:+UseCMSInitiatingOccupancyOnly -XX:+DisableExplicitGC -XX:+AlwaysPreT    ouch -Dfile.encoding=UTF-8'

########################################

docker build -t $DOCKER_IMAGE_NAME .

docker stop $DOCKER_CONTAINER_NAME && docker rm $DOCKER_CONTAINER_NAME

docker run -d -p 8080:8080 --name $DOCKER_CONTAINER_NAME $DOCKER_IMAGE_NAME $JAVA_OPTS
