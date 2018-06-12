FROM alpine:latest
ARG REV=latest

RUN apk update && apk --no-cache add openjdk8-jre git curl && \
mkdir -p /opt/spigot

WORKDIR /opt/spigot

RUN curl -L -O https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && \
    java -jar BuildTools.jar --rev $REV && \
    mv spigot-*.jar /opt/spigot.jar

WORKDIR /opt

RUN rm -rf /opt/spigot && \
    rm -rf /root/.m2 && \
    mkdir /data

EXPOSE 25565

WORKDIR /data

CMD ["java", "-Xms512M", "-Xmx1536M", "-XX:+UseConcMarkSweepGC", "-jar", "/opt/spigot.jar", "--noconsole"]
