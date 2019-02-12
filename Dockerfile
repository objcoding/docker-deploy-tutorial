FROM openjdk:8u111-jre
MAINTAINER zhangchenghui<zhangchenghui.dev@gmail.com>

VOLUME ["/chaos/heap_dump"]
ENV TZ=Asia/Phnom_Penh
ARG ACTIVE
ENV ACTIVE $ACTIVE

COPY target/docker-jenkins-sample-1.0-SNAPSHOT.jar /app.jar
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

EXPOSE 8085
ENTRYPOINT ["sh", "-c", "java -Xms128M -Xmx128M -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/chaos/heap_dump -Dspring.profiles.active=$ACTIVE -jar /app.jar"]
