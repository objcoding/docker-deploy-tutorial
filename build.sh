#!/bin/bash

# env
active=${1:-master}
registry="chenghuizhang"
timestamp=`date +%Y%m%d%H%M%S`
servicename=docker-jenkins-sample

# build
echo "构建镜像：$registry/$servicename:$active-$timestamp"
docker build --build-arg ACTIVE=${active} -t ${registry}/${servicename}:${active}-${timestamp} .
echo "上传镜像：$registry/$servicename:$active-$timestamp"
docker push ${registry}/${servicename}:${active}-${timestamp}
echo "标记镜像：$registry/$servicename:$active"
docker tag ${registry}/${servicename}:${active}-${timestamp} ${registry}/${servicename}:${active}
docker push ${registry}/${servicename}:${active}
echo "构建完成！"