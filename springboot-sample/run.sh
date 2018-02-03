#!/bin/bash

#########################################

#项目地址
PROJECT_DIRETORY='/Users/zhangchenghui/Documents/spring-boot-starter-tutorial/spring-boot-starter-samples/spring-boot-starter-helloworld-sample'
#dockerfile地址
DOCKER_FILE_DIRETORY='/Users/zhangchenghui/Documents/docker-deploy/springboot-sample'
#复制到dockerfile目录下的springboot jar包名称
PACKAGE_NAME='spring-boot-application-`date +%Y%m%d%H%M`'
#docker镜像名称
DOCKER_IMAGE_NAME='helloworld:v1'
#docker容器名称
DOCKER_CONTAINER_NAME='helloworld'
#编译生成的springboot jar包名称
SPRING_BOOT_APPLICATION_NAME='spring-boot-starter-helloworld-sample-1.0-SNAPSHOT.jar'
JAVA_OPTS='-Xms1.5g -Xmx1.5g -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyF    raction=75 -XX:+UseCMSInitiatingOccupancyOnly -XX:+DisableExplicitGC -XX:+AlwaysPreT    ouch -Dfile.encoding=UTF-8'

########################################


#cd $PROJECT_DIRETORY

#if [ "" = "$1"  ]
#then
#    git branch
#    echo 'input branch name:'
#    read BRANCH
#fi

#git fetch --all
#git reset --hard
#git checkout master
#git pull
#git checkout $BRANCH
#git pull

#mvn clean install -Dmaven.test.skip=true

#cd $PROJECT_DIRETORY/target

#cp $SPRING_BOOT_APPLICATION_NAME $DOCKER_FILE_DIRETORY/$PACKAGE_NAME.jar

#cd $DOCKER_FILE_DIRETORY

docker build -t $DOCKER_IMAGE_NAME .

docker stop $DOCKER_CONTAINER_NAME && docker rm $DOCKER_CONTAINER_NAME

docker run -d -p 8080:8080 --name $DOCKER_CONTAINER_NAME $DOCKER_IMAGE_NAME $JAVA_OPTS
