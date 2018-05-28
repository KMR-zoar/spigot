FROM alpine:latest
ARG REV=latest

RUN apk update
RUN apk --no-cache add openjdk8-jre git curl

RUN mkdir -p /opt/spigot
WORKDIR /opt/spigot

RUN curl -L -O https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar



RUN java -jar BuildTools.jar --rev $REV

RUN find * -maxdepth 0 ! -name "*.jar" -exec rm -rf {} \;
RUN rm -rf /root/.m2

RUN mkdir /data
EXPOSE 25565

WORKDIR /data

CMD ["java", "-Xms512M", "-Xmx1536M", "-XX:+UseConcMarkSweepGC", "-jar", "/opt/spigot/spigot.jar", "--noconsole"]
