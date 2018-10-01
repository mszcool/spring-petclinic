FROM openjdk:8-jre-slim

VOLUME /tmp

ARG VAR_JAR_FILE
ARG VAR_MYSQL_HOST=jdbc:mysql://localhost/petclinic_db
ARG VAR_MYSQL_USER=petclinic

ENV MYSQL_HOST=$VAR_MYSQL_HOST
ENV MYSQL_USER=$VAR_MYSQL_USER
ENV MYSQL_PASSWORD=pleaseoverridewithenvparameteratruntime

COPY ${JAR_FILE} application

ENTRYPOINT java -jar /application/target/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar --database=mysql --spring.datasource.url=$MYSQL_HOST --spring.datasource.username=$MYSQL_USER --spring.datasource.password=$MYSQL_PASSWORD