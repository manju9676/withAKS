# Multi-stage Dockerfile: build with Maven, run on Tomcat
FROM maven:3.9.6-eclipse-temurin-11 AS build
WORKDIR /workspace

# Copy only what we need to build the WAR
COPY pom.xml ./
COPY src ./src

RUN mvn -B package -DskipTests

FROM tomcat:9.0-jdk11

# Copy built WAR into Tomcat webapps as ROOT
COPY --from=build /workspace/target/sample-webapp-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
