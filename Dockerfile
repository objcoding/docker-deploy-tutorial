FROM openjdk:8u111-jre
MAINTAINER zhangchenghui.dev@gmail.com

ADD target/docker-maven-sample-1.0-SNAPSHOT.jar /app.jar

EXPOSE 8085

ENTRYPOINT [ "java", "-jar", "app.jar" ]
