From java:8

MAINTAINER zhangchenghui zhangchenghui.dev@gamil.com

#RUN apt-get update && apt-get install apt-utils && apt-get install apt-transport-https && apt-get install maven3

ADD spring-boot-starter-helloworld-sample-1.0-SNAPSHOT.jar /app.jar

EXPOSE 8080

ENTRYPOINT [ "java", "-jar", "app.jar" ]
