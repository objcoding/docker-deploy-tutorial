FROM openjdk:8u111-jre
MAINTAINER zhangchenghui<zhangchenghui.dev@gmail.com>
VOLUME ["/chaos/heap_dump"]
COPY target/docker-jenkins-sample-1.0-SNAPSHOT.jar /app.jar

ENV TZ=Asia/Phnom_Penh
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG ACTIVE
ENV ACTIVE $ACTIVE
ENTRYPOINT [\
            "sh",\
            "-c",\
            "java -Xms128M -Xmx128M -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/chaos/heap_dump -Dspring.profiles.active=$ACTIVE -jar /app.jar"\
            ]
EXPOSE 8085

HEALTHCHECK --interval=10s --timeout=3s --start-period=5m --retries=3 \
  CMD curl -f http://localhost:8085/info || exit 1
