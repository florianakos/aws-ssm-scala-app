FROM openjdk:8-jdk-alpine

MAINTAINER flrnks <flrnks@flrnks.netlify.com>

ADD target/scala-cli-app-1.0.0.jar /usr/share/backend/app.jar

ENTRYPOINT [ "/usr/bin/java", "-jar", "/usr/share/backend/app.jar"]
