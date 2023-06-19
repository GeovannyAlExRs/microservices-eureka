FROM openjdk:17
LABEL authors="Geovanny AlEx Rs"
EXPOSE 8080
RUN mkdir -p
COPY target/microservices-eureka-0.0.1-SNAPSHOT.jar app-eureka.jar
ENTRYPOINT ["java", "-jar", "/app-eureka.jar"]