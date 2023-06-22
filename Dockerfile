# Usar una imagen base con JDK 19 y Maven
FROM maven:3.3.1-jdk-8-onbuild-openjdk:22-nanoserver AS build

# Establecer un directorio de trabajo
WORKDIR /target

# Copiar archivos de tu proyecto al directorio de trabajo
COPY . target/

# Ejecutar Maven para construir el proyecto
RUN mvn clean package

# Crear una nueva imagen basada en OpenJDK 19
FROM openjdk:22-nanoserver

# Exponer el puerto que utilizará la aplicación
EXPOSE 8080

# Copiar el archivo JAR construido desde la etapa anterior
COPY --from=build ./target/microservices-eureka-0.0.1-SNAPSHOT.jar microservices-eureka.jar

# Establecer el punto de entrada para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "microservices-eureka.jar"]

LABEL authors="Geovanny AlEx Rs"