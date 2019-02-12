FROM openjdk:8u111-jre
MAINTAINER zhangchenghui<zhangchenghui.dev@gmail.com>

COPY target/docker-jenkins-sample-1.0-SNAPSHOT.jar /app.jar
ENV TZ=Asia/Phnom_Penh
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG ACTIVE
ENV ACTIVE $ACTIVE

EXPOSE 8085
ENTRYPOINT ["sh", "-c", "java -jar /app.jar"]
