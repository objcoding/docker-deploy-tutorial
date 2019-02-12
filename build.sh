#!/usr/bin/env bash

active=${1:-master}
registry="chenghuizhang"
timestamp=`date +%Y%m%d%H%M%S`
servicename=docker-jenkins-sample
# echo `git log | grep -e 'commit [a-zA-Z0-9]*' | wc -l`
#files=`git diff --name-only HEAD~ HEAD`
#printf "git提交的文件：\n%s\n" "${files[@]}"
#authors=`git log --oneline -1 --format=%an`
#printf "git提交作者：\n%s\n" "${authors[@]}"
# build
echo "开始构建：$registry/$servicename:$active-$timestamp"
docker build --build-arg ACTIVE=${active} -t ${registry}/${servicename}:${active}-${timestamp} .
echo "上传镜像：$registry/$servicename:$active-$timestamp"
docker push ${registry}/${servicename}:${active}-${timestamp}
echo "开始标记版本为$active镜像：$registry/$servicename:$active-$timestamp"
docker tag ${registry}/${servicename}:${active}-${timestamp} ${registry}/${servicename}:${active}
docker push ${registry}/${servicename}:${active}
echo "构建完成！"