FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn package
RUN ls -al /app/target  

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar /app/mon-application.jar  
ENTRYPOINT ["java", "-jar", "/app/mon-application.jar"]
