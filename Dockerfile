FROM openjdk:17-jdk-slim
LABEL authors="Geovanny AlEx Rs"
RUN apt-get update
COPY "./target/microservices-eureka-0.0.1-SNAPSHOT.jar" "appeureka.jar"
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/appeureka.jar"]