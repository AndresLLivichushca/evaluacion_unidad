# Etapa de construcción
FROM gradle:8.5-jdk17 AS build
COPY --chown=gradle:gradle . /home/gradle/project
WORKDIR /home/gradle/project
RUN gradle clean build -x test --no-daemon

# Etapa de ejecución
FROM eclipse-temurin:17-jdk-alpine
COPY --from=build /home/gradle/project/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]
