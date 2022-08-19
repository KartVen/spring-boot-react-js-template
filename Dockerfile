FROM maven:3.8.6-openjdk-18-slim
AS BUILD
COPY ./pom.xml ./pom.xml
RUN mvn dependency:go-offline -B
COPY ./src ./src
RUN mvn clean package

FROM openjdk:17.0.2-slim-buster
EXPOSE 8080
COPY --from=BUILD /target/*.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]