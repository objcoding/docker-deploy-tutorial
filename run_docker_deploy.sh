echo 'input port:'
read PORT
echo 'input tag:'
read TAG
echo 'input container name:'
read NAME

docker stop $NAME

docker rm $NAME

docker pull 127.0.0.1:5000/docker-maven-deploy:$TAG

docker run -d -p $PORT:8085 -v /data/logs/:/data/logs/ --name $NAME 127.0.0.1:5000/docker-maven-deploy:$TAG

tail -200f /data/logs/helloworld-server.log